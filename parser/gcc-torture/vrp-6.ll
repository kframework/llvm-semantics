; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/vrp-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @test01(i32 %a, i32 %b) nounwind uwtable {
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
  %sub = sub i32 %tmp5, %tmp6
  %cmp7 = icmp ne i32 %sub, 5
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end4
  ret void
}

declare void @abort() noreturn

define void @test02(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp uge i32 %tmp, 12
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ugt i32 %tmp1, 15
  br i1 %cmp2, label %if.then3, label %if.end8

if.then3:                                         ; preds = %if.then
  %tmp4 = load i32* %a.addr, align 4
  %tmp5 = load i32* %b.addr, align 4
  %sub = sub i32 %tmp4, %tmp5
  %cmp6 = icmp ult i32 %sub, -16
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then3
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %if.then3
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %entry
  ret void
}

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
  %add = add i32 %tmp, 5
  %tmp1 = load i32* %x, align 4
  call void @test01(i32 %add, i32 %tmp1)
  call void @test02(i32 14, i32 16)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
