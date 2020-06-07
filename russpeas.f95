! !   Indeep Farma
! !   1015266
! !   ifarma@uoguelph.ca
! !   Assignment 4 RPM

! Take in 2 inputs and find the product of them
program russpeas

!   Declaring Variablles
    integer(8) :: m, n, recmul, itmul
    real :: startRec, endRec, timeRec, startIt, endIt, timeIt

!   Obtain user input
    write(*,*) "Please enter the first digit you'd like to multiply (whole numbers)"
    read(*,*) m
    write(*,*) "Please enter the second digit you'd like to multiply (whole numbers)"
    read(*,*) n

    write(*,*) "****************************"
    write(*,*) "Recursive multiplication: "

!   Find product recursive
    call cpu_time(startRec)
    write(*,*) recmul(m, n)
    call cpu_time(endRec)

!   Calculate recursive timeRec
    timeRec = (endRec - startRec)

!   Print output
    write(*,*) "Time taken to calculate recursive method: ", timeRec
    write(*,*) "****************************"

    write(*,*) "****************************"
    write(*,*) "Iterative multiplication: "

!   Find product iterative
    call cpu_time(startIt)
    write(*,*) itmul(m, n)
    call cpu_time(endIt)

!   Calculate iterative timeRec
    timeIt = (endIt - startIt)

!   Print output
    write(*,*) "Time taken to calculate iterative method: ", timeIt
    write(*,*) "****************************"

end program

!   Recursively find product
recursive function recmul(m, n) result(p)

!   Declaring Variables
    integer(8) :: p
    integer(8), intent(in) :: m, n

!   Calculate Product
    if (m == 0) then
        p = 0
    else if (m == 1) then
        p = n
    else if ((m > 1) .and. (mod(m, 2) == 0)) then
        p = recmul((m/2), (n+n))
    else if ((m > 1) .and. (mod(m, 2) == 1)) then
        p = (n + (recmul((m/2), (n+n))))
    end if

end function recmul

!   Iteratively find product
integer(8) function itmul(m, n) result(p)

!   Declaring variables
    integer(8) :: prod = 0
    integer(8) :: m, n

!   Calculate product
    do while (n /= 0)
        if((mod(m, 2)) == 1) then
            p = (n + p)
        end if
        m = m / 2
        n = n + n
    end do
end function itmul
