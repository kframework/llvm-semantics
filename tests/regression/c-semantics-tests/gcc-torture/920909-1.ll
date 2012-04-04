; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920909-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32* %a.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 1026, label %sw.bb
    i32 1027, label %sw.bb1
    i32 1028, label %sw.bb3
    i32 1029, label %sw.bb5
    i32 1030, label %sw.bb7
    i32 1031, label %sw.bb8
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32* %a.addr, align 4
  %add = add nsw i32 %1, 1
  store i32 %add, i32* %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  %2 = load i32* %a.addr, align 4
  %add2 = add nsw i32 %2, 2
  store i32 %add2, i32* %retval
  br label %return

sw.bb3:                                           ; preds = %entry
  %3 = load i32* %a.addr, align 4
  %add4 = add nsw i32 %3, 3
  store i32 %add4, i32* %retval
  br label %return

sw.bb5:                                           ; preds = %entry
  %4 = load i32* %a.addr, align 4
  %add6 = add nsw i32 %4, 4
  store i32 %add6, i32* %retval
  br label %return

sw.bb7:                                           ; preds = %entry
  store i32 1, i32* %retval
  br label %return

sw.bb8:                                           ; preds = %entry
  store i32 4, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb8, %sw.bb7, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  %5 = load i32* %retval
  ret i32 %5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32)* @f to i32 (...)*)(i32 1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
