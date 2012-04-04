; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x-6-5-2-5-15.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load %struct.s** %p, align 8
  store %struct.s* %0, %struct.s** %q, align 8
  %i = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 0
  %1 = load i32* %j, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %j, align 4
  store i32 %1, i32* %i, align 4
  store %struct.s* %.compoundliteral, %struct.s** %p, align 8
  %2 = load i32* %j, align 4
  %cmp = icmp slt i32 %2, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %again
  br label %again

if.end:                                           ; preds = %again
  %3 = load %struct.s** %p, align 8
  %4 = load %struct.s** %q, align 8
  %cmp1 = icmp eq %struct.s* %3, %4
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %5 = load %struct.s** %q, align 8
  %i2 = getelementptr inbounds %struct.s* %5, i32 0, i32 0
  %6 = load i32* %i2, align 4
  %cmp3 = icmp eq i32 %6, 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %7 = phi i1 [ false, %if.end ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %7 to i32
  ret i32 %land.ext
}
