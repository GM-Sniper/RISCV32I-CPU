module CPU(
    input  clk,  // Clock input
    input rst,  // Reset input
    output [6:0] segments,  // 7-segment display output
    output [3:0] anode,  // Anode output for 7-segment display
    output alarmSound  // Alarm sound output
);

    // Clock dividers to generate different clock frequencies
    clk_div #(250000) clo(.clk(clk),.rst(rst),.out_clk(clk_200));
    clk_div #(50000000) cl(.clk(clk),.rst(rst),.out_clk(clk_out));

    // Registers for data and program counter
    reg [31:0] data; 
    reg [11:0] programCounter;

    // Wires for various signals in the CPU
    wire [11:0] programOutput; 
    wire [31:0] instructions;
    wire [31:0] A_data;
    wire [31:0] B_data; 
    wire RegWrite;
    wire MemtoReg;
    wire MemWrite;
    wire MemRead;
    wire Branch;
    wire [1:0] Jump;
    wire  ALUSrc;
    wire ALUop;
    wire LUI;
    wire AUIPC;  
    wire ZFlag,NFlag,CFlag, OFlag; 
    wire [31:0] ALUresult;   
    wire test;

    // Program ROM and Control Unit
    program_ROM PR(.clk(clk_out),.address(programCounter),.data(instructions));
    ControlUnit CU(.opcode(instructions[6:0]),.RegWrite(RegWrite),.MemtoReg(MemtoReg),.MemWrite(MemWrite),
    .MemRead(MemRead),.Branch(Branch),.Jump(Jump),.ALUSrc(ALUSrc),.ALUop(ALUop),.AUIPC(AUIPC),.LUI(LUI),.test(test));

    // Register file
    registerFile rgf(.clk(clk_out),.rst(rst),.Rs1_data(A_data),.Rs2_data(B_data),.Write_Rd_data(data),.Rs1_addr(instructions[19:15]),.Rs2_addr(instructions[24:20]),.Rd_addr(instructions[11:7]),.writeControl(RegWrite));

    // Immediate generator
    ImmGen imgen(.instructions(instructions),.immediate(immgenout));

    // ALU
    ALU al(.A(in1),.B(in2),.ALUop(ALUop),.ALUControl({instructions[30],instructions[14:12]}),.Result(ALUresult),.ZFlag(ZFlag),.NFlag(NFlag),.CFlag(CFlag),.OFlag(OFlag));   

    // Data display
    data_display dis(.data(data),.units(units),.tens(tens),.hundreds(hundreds),.thousands(thousands));

    // 7-segment display
    Sev_segment_display svg(.clk(clk_200),.rst(rst),.units(test?4'd10:units),.tens(test?4'd10:tens),.hundreds(test?4'd10:hundreds),.thousands(test?4'd10:thousands),.active_anode(anode),.seg(segments)); 

    // Branch control
    Branch_Control BC(.B_control(instructions[14:12]),.Zflag(ZFlag),.Nflag(NFlag),
    .Cflag(CFlag),.Oflag(OFlag),.Branch(Branch),.BranchTaken(branching));

    // Memory data
    memory_data md(.clk(clk_out),.write_data(MemWrite),.sel(instructions[14:12]),.read_data(MemRead),.addr(ALUresult),.data_in(B_data),.data_out(Readdata));

    // Always block for program counter update
    always @(posedge clk_out or posedge rst) begin
        if(rst)begin
            programCounter=12'd0;
        end
        else begin 
            case(PCselect) 
                3'b000:programCounter<=programCounter+4; 
                3'b010: programCounter<=shifted;
                3'b100: programCounter<=ALUresult[11:0];
                3'b001: programCounter<=programCounter+shifted; 
            endcase
        end
    end

    // Always block for data update
    always @(posedge clk_out) begin
        case(Dataselect)
            2'b000:data=ALUresult;
            2'b001: data=Readdata;
            2'b010: data=immgenout;
            2'b100: data= programCounter+4;
            default: data=32'd0;
        endcase
    end
endmodule