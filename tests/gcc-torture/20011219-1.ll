; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20011219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"foo\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"bar\00", align 1

define void @bar(i8* %x, i32 %y, i8* %z) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32, align 4
  %z.addr = alloca i8*, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  store i8* %z, i8** %z.addr, align 8
  ret void
}

define i64 @foo(i32 %x, i8* %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %a = alloca i64, align 8
  store i32 %x, i32* %x.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i32* %x.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 10, label %sw.bb
    i32 11, label %sw.bb3
    i32 12, label %sw.bb6
    i32 13, label %sw.bb9
    i32 14, label %sw.bb12
  ]

sw.bb:                                            ; preds = %entry
  %tmp1 = load i8** %y.addr, align 8
  %0 = bitcast i8* %tmp1 to i64*
  %tmp2 = load i64* %0
  store i64 %tmp2, i64* %a, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %tmp4 = load i8** %y.addr, align 8
  %1 = bitcast i8* %tmp4 to i64*
  %tmp5 = load i64* %1
  store i64 %tmp5, i64* %a, align 8
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  %tmp7 = load i8** %y.addr, align 8
  %2 = bitcast i8* %tmp7 to i64*
  %tmp8 = load i64* %2
  store i64 %tmp8, i64* %a, align 8
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %tmp10 = load i8** %y.addr, align 8
  %3 = bitcast i8* %tmp10 to i64*
  %tmp11 = load i64* %3
  store i64 %tmp11, i64* %a, align 8
  br label %sw.epilog

sw.bb12:                                          ; preds = %entry
  %tmp13 = load i8** %y.addr, align 8
  %4 = bitcast i8* %tmp13 to i64*
  %tmp14 = load i64* %4
  store i64 %tmp14, i64* %a, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @bar(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 1, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb12, %sw.bb9, %sw.bb6, %sw.bb3, %sw.bb
  %tmp15 = load i64* %a, align 8
  ret i64 %tmp15
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 24, i64* %i, align 8
  %0 = bitcast i64* %i to i8*
  %call = call i64 @foo(i32 13, i8* %0)
  %cmp = icmp ne i64 %call, 24
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
