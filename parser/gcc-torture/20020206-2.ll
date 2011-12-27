; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020206-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i16 }

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %tmp, 2048
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %x.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2064
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  ret void
}

declare void @abort() noreturn

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %.compoundliteral = alloca %struct.A, align 2
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %a = getelementptr inbounds %struct.A* %.compoundliteral, i32 0, i32 0
  %tmp1 = load i32* %i, align 4
  %shr = ashr i32 %tmp1, 4
  %tobool = icmp ne i32 %shr, 0
  br i1 %tobool, label %cond.false, label %cond.true

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %shr3 = ashr i32 %tmp2, 4
  %add = add nsw i32 64, %shr3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 8, %cond.true ], [ %add, %cond.false ]
  %shl = shl i32 %cond, 8
  %tmp4 = load i32* %i, align 4
  %shl5 = shl i32 %tmp4, 4
  %add6 = add nsw i32 %shl, %shl5
  %conv = trunc i32 %add6 to i16
  store i16 %conv, i16* %a, align 2
  %a7 = getelementptr inbounds %struct.A* %.compoundliteral, i32 0, i32 0
  %tmp8 = load i16* %a7, align 2
  %conv9 = zext i16 %tmp8 to i32
  call void @foo(i32 %conv9)
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp10 = load i32* %i, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
