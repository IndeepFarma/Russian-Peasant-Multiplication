--   Indeep Farma
--   1015266
--   ifarma@uoguelph.ca
--   Assignment 4 RPM

with ada.Text_IO;                   use Ada.Text_IO;
with ada.Integer_Text_IO;           use Ada.Integer_Text_IO;
with ada.Long_Long_Integer_Text_IO; use Ada.Long_Long_Integer_Text_IO;
with ada.Calendar;                  use Ada.Calendar;

--Takes in two whole numbers and multiplies them togeter
procedure russ_peas is

    --Declaring Variables
    inA, inB, prod, prodIt : long_long_integer range 0..2**62;
    startRec, startIt, endRec, endIt : Time;
    timeRec, timeIt: Duration;

    -- Finds the product recursively
    function recMultiply(m: long_long_integer; n: long_long_integer) return long_long_integer is

    -- Calculate product
    begin
        if (m = 0) then
            return 0;
        elsif (m = 1) then
            return n;
        elsif ((m > 1) and ((m mod 2) = 0)) then
            return recMultiply((m/2), (n+n));
        elsif ((m > 1) and ((m mod 2) = 1)) then
            return n + recMultiply((m/2), (n+n));
        end if;
        return 0;
    --End of the recursive function
    end recMultiply;

    --Finds the product iteratively
    function itMultiply(m: in out long_long_integer; n: in out long_long_integer) return long_long_integer is
        -- Declaring variables
        p : long_long_integer range 0..2**62 := 0;

        begin
            --Calculate the product
              while (m /= 0) loop
                  if((m mod 2) = 1) then
                    p := (n + p);
                  end if;
                  n := n + n;
                  m := m / 2;
              end loop;

            -- Return the product
              return p;
    --End of iterative function
    end itMultiply;

--Start the main procedure
begin

    --Get the input from user
    put_line("Please enter the first digit you'd like to multiply (whole numbers)");
    get(inA);
    put_line("Please enter the second digit you'd like to multiply (whole numbers)");
    get(inB);

    --Start timer
    startRec := Clock;
    --Calculate the product through recursive function
    prod := recMultiply(inA, inB);
    --End Timer
    endRec := Clock;

    --Start iterative timer
    startIt := Clock;
    --Calculate the product through iterative function
    prodIt := itMultiply(inA, inB);
    --End iterative time
    endIt := Clock;

    --Calculate time
    timeRec := endRec - startRec;
    timeIt := endIt - startIt;

    --Print out the final answer
    put_line("****************************************");
    put_line("Recursive function answer: ");
    put(prod);
    new_line;
    put_line("Time taken to calculate recursive method: " & Duration'Image(timeRec));
    put_line("****************************************");

    --Print out the final answer
    put_line("Iterative function answer: ");
    put(prodIt);
    new_line;
    put_line("Time taken to calculate iterative method: " & Duration'Image(timeIt));
    put_line("****************************************");

end russ_Peas;
