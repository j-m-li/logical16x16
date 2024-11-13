// 
// This software is dedicated to the public domain.
//
// https://homepage.cs.uiowa.edu/~jones/ternary/arith.shtml#comptwo
//


task compare33_3 (
	output reg [1:0] O_c,
	input [5:0] I_a,
	input [5:0] I_b
);

reg [1:0] c_0;
reg [1:0] c_1;
reg [1:0] c_2;
reg [1:0] c_10;

begin
	compare33_y(c_0, I_a[1:0], I_b[1:0]);
	compare33_y(c_1, I_a[3:2], I_b[3:2]);
	compare33_y(c_2, I_a[5:4], I_b[5:4]);
	compare33_x(c_10, c_0, c_1);
	compare33_x(O_c, c_10, c_2);
end
endtask

// meaning 
// - = <
// 0 = =
// + = >
task compare33_x (
	output reg [1:0] O_c,
	input [1:0] I_a,
	input [1:0] I_b
);

begin
	case (I_b)
	2'b10: begin
		case (I_a)
		2'b10:   O_c = 2'b10; // --
		default: O_c = 2'b10; // -0
		2'b01:   O_c = 2'b10; // -+
		endcase
	end
	default: begin
		case (I_a)
		2'b10:   O_c = 2'b10; // 0-
		default: O_c = 2'b00; // 00
		2'b01:   O_c = 2'b01; // 0+
		endcase
	end
	2'b01: begin
		case (I_a)
		2'b10:   O_c = 2'b01; // +-
		default: O_c = 2'b01; // +0
		2'b01:   O_c = 2'b01; // ++
		endcase
	end
	endcase	
end
endtask


// meaning 
// - = <
// 0 = =
// + = >
task compare33_y (
	output reg [1:0] O_c,
	input [1:0] I_a,
	input [1:0] I_b
);

begin
	case (I_b)
	2'b10: begin
		case (I_a)
		2'b10:   O_c = 2'b00; // --
		default: O_c = 2'b01; // -0
		2'b01:   O_c = 2'b01; // -+
		endcase
	end
	default: begin
		case (I_a)
		2'b10:   O_c = 2'b10; // 0-
		default: O_c = 2'b00; // 00
		2'b01:   O_c = 2'b01; // 0+
		endcase
	end
	2'b01: begin
		case (I_a)
		2'b10:   O_c = 2'b10; // +-
		default: O_c = 2'b10; // +0
		2'b01:   O_c = 2'b00; // ++
		endcase
	end
	endcase	
end
endtask
