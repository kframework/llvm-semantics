; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/medce-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ok = internal global i32 0, align 4

define void @bar() nounwind uwtable {
entry:
  store i32 1, i32* @ok, align 4
  ret void
}

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  br i1 false, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb
  call void @link_error()
  br label %sw.bb1

sw.bb1:                                           ; preds = %entry, %if.then
  call void @bar()
  br label %if.end

if.end:                                           ; preds = %sw.bb1, %sw.bb
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end, %entry
  ret void
}

declare void @link_error()

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 1)
  %0 = load i32* @ok, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
