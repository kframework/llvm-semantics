; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920909-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  switch i32 %tmp, label %sw.epilog [
    i32 1026, label %sw.bb
    i32 1027, label %sw.bb2
    i32 1028, label %sw.bb5
    i32 1029, label %sw.bb8
    i32 1030, label %sw.bb11
    i32 1031, label %sw.bb12
  ]

sw.bb:                                            ; preds = %entry
  %tmp1 = load i32* %a.addr, align 4
  %add = add nsw i32 %tmp1, 1
  store i32 %add, i32* %retval
  br label %return

sw.bb2:                                           ; preds = %entry
  %tmp3 = load i32* %a.addr, align 4
  %add4 = add nsw i32 %tmp3, 2
  store i32 %add4, i32* %retval
  br label %return

sw.bb5:                                           ; preds = %entry
  %tmp6 = load i32* %a.addr, align 4
  %add7 = add nsw i32 %tmp6, 3
  store i32 %add7, i32* %retval
  br label %return

sw.bb8:                                           ; preds = %entry
  %tmp9 = load i32* %a.addr, align 4
  %add10 = add nsw i32 %tmp9, 4
  store i32 %add10, i32* %retval
  br label %return

sw.bb11:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

sw.bb12:                                          ; preds = %entry
  store i32 4, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb12, %sw.bb11, %sw.bb8, %sw.bb5, %sw.bb2, %sw.bb
  %0 = load i32* %retval
  ret i32 %0
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
