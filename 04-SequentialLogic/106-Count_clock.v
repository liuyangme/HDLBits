module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    always @(posedge clk) begin
        if(reset)
        begin
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'b00_000_000;
            ss <= 8'b00_000_000;
        end
        else if(ena)
        begin
            
            if((hh == 8'h11)&&(mm == 8'h59)&&(ss == 8'h59))
            begin
                pm <= ~pm;
            end

            if(ss == 8'h59)
            begin
                ss <= 8'd00;
                if(mm == 8'h59)
                begin
                    mm <= 8'h00;
                    if(hh == 8'h12)
                    begin
                        hh <= 8'd01;
                    end
                    else if(hh[3:0]==4'h9)
                    begin
                        hh[3:0] <= 4'h0;
                        hh[7:4] <= hh[7:4] + 1'b1;
                    end
                    else
                    begin
                        hh <= hh + 1'b1;
                    end
                end
                else if(mm[3:0] == 4'h9)
                begin
                    mm[3:0] <= 4'h0;
                    mm[7:4] <= mm[7:4] + 1'b1;
                end
                else
                begin
                    mm <= mm + 1'b1;
                end
                
            end
            else if(ss[3:0]==4'h9)
            begin
                ss[3:0] <= 4'h0;
                ss[7:4] <= ss[7:4] + 1'b1;
            end
            else
            begin
                ss <= ss + 1'b1;
            end
        end
    end

endmodule