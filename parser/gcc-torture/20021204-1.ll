; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021204-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"test\00", align 1
@z = common global i32 0, align 4

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8** %a, align 8
  %tmp = load i8** %a, align 8
  %add.ptr = getelementptr inbounds i8* %tmp, i64 2
  store i8* %add.ptr, i8** %b, align 8
  %tmp1 = load i32* @z, align 4
  %cmp = icmp sgt i32 %tmp1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8** %b, align 8
  %tmp3 = load i8** %a, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %tmp2 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %tmp3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8** %b, align 8
  %tmp5 = load i8** %a, align 8
  %sub.ptr.lhs.cast6 = ptrtoint i8* %tmp4 to i64
  %sub.ptr.rhs.cast7 = ptrtoint i8* %tmp5 to i64
  %sub.ptr.sub8 = sub i64 %sub.ptr.lhs.cast6, %sub.ptr.rhs.cast7
  %sub = sub nsw i64 %sub.ptr.sub8, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub.ptr.sub, %cond.true ], [ %sub, %cond.false ]
  %conv = trunc i64 %cond to i32
  call void @foo(i32 %conv)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
