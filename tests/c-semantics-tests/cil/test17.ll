; ModuleID = '/home/david/src/c-semantics/tests/cil/test17.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"hello world - %d %d %d %d\0A\00", align 1

define i32 @silly(i32 %w) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w.addr = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %w, i32* %w.addr, align 4
  store i32 7, i32* %a, align 4
  %0 = load i32* %w.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 11, label %sw.bb
    i32 5, label %sw.bb1
    i32 6, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  store i32 22, i32* %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  store i32 9, i32* %a, align 4
  br label %sw.bb2

sw.bb2:                                           ; preds = %entry, %sw.bb1
  %1 = load i32* %a, align 4
  %mul = mul nsw i32 %1, 7
  store i32 %mul, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  %2 = load i32* %a, align 4
  store i32 %2, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb2, %sw.bb
  %3 = load i32* %retval
  ret i32 %3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @silly(i32 0)
  %call1 = call i32 @silly(i32 11)
  %call2 = call i32 @silly(i32 5)
  %call3 = call i32 @silly(i32 6)
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str, i32 0, i32 0), i32 %call, i32 %call1, i32 %call2, i32 %call3)
  ret i32 0
}

declare i32 @printf(i8*, ...)
