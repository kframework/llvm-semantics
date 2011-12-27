; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/vrp-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @test(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ult i32 %tmp, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ult i32 %tmp1, 5
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end4:                                          ; preds = %if.end
  %tmp5 = load i32* %a.addr, align 4
  %tmp6 = load i32* %b.addr, align 4
  %add = add i32 %tmp5, %tmp6
  %cmp7 = icmp ne i32 %add, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end4
  ret void
}

declare void @abort() noreturn

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 -2147483648, i32* %x, align 4
  %tmp = load i32* %x, align 4
  %tmp1 = load i32* %x, align 4
  call void @test(i32 %tmp, i32 %tmp1)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
