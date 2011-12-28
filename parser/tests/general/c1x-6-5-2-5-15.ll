; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x-6-5-2-5-15.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.s*, align 8
  %q = alloca %struct.s*, align 8
  %j = alloca i32, align 4
  %.compoundliteral = alloca %struct.s, align 4
  store i32 0, i32* %retval
  store %struct.s* null, %struct.s** %p, align 8
  store i32 0, i32* %j, align 4
  br label %again

again:                                            ; preds = %if.then, %entry
  %tmp = load %struct.s** %p, align 8
  store %struct.s* %tmp, %struct.s** %q, align 8
  %i = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 0
  %tmp1 = load i32* %j, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %j, align 4
  store i32 %tmp1, i32* %i, align 4
  store %struct.s* %.compoundliteral, %struct.s** %p, align 8
  %tmp2 = load i32* %j, align 4
  %cmp = icmp slt i32 %tmp2, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %again
  br label %again

if.end:                                           ; preds = %again
  %tmp3 = load %struct.s** %p, align 8
  %tmp4 = load %struct.s** %q, align 8
  %cmp5 = icmp eq %struct.s* %tmp3, %tmp4
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %tmp6 = load %struct.s** %q, align 8
  %i7 = getelementptr inbounds %struct.s* %tmp6, i32 0, i32 0
  %tmp8 = load i32* %i7, align 4
  %cmp9 = icmp eq i32 %tmp8, 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %0 = phi i1 [ false, %if.end ], [ %cmp9, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}
