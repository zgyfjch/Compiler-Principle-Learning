; target triple = "x86_64-pc-linux-gnu" run for this environment
target triple = "riscv64-unknown-elf"

; run for target environment

;declare i32 @__isoc99_scanf(i8*,...)
;declare i32 @printf(i8*,...)
;lib SysY
declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
;libc
;@str1= private unnamed_addr constant [3 x i8] c"%d\00",align 1
;@str2= private unnamed_addr constant [4 x i8] c"%d\0A\00",align 1

define i32 @factorial(i32 %0) {
entry:
    br label %loop_head
loop_head:
    %i = phi i32 [%0, %entry], [%i_next, %loop_body]
    %sum = phi i32 [1, %entry],[%sum_next, %loop_body]
    %cond = icmp sle i32 %i, 1
    br i1 %cond, label %loop_end, label %loop_body
loop_body:
    %sum_next = mul i32 %sum,%i
    %i_next = sub i32 %i,1
    br label %loop_head
loop_end:
    ret i32 %sum
}

define i32 @main(){
    ;%1 = alloca i32,align 4
    ;%2= call i32(i8*,...) @__isoc99_scanf(i8* getelementptr inbounds([3 x i8],[3 x i8]* @str1,i64 0,i64 0),i32* %1)
    %1=call i32() @getint()
    ;%3 = load i32,i32 %1,align 4
    %2 = call i32 @factorial(i32 %1)
    call void(i32) @putint(i32 %2)
    call void(i32) @putch(i32 10)
    ;%5 = call i32(i8*,...) @printf(i8* getelementptr inbounds([4 x i8],[4 x i8]* @str2,i64 0,i64 0),i32 %4)
    ret i32 0
}
