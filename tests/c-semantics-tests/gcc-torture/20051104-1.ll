; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051104-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i8* }

@s = common global %struct.anon zeroinitializer, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), align 4
  store i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8** getelementptr inbounds (%struct.anon* @s, i32 0, i32 1), align 8
  %0 = load i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), align 4
  %idxprom = sext i32 %0 to i64
  %1 = load i8** getelementptr inbounds (%struct.anon* @s, i32 0, i32 1), align 8
  %arrayidx = getelementptr inbounds i8* %1, i64 %idxprom
  %2 = load i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), align 4
  %idxprom2 = sext i32 %3 to i64
  %4 = load i8** getelementptr inbounds (%struct.anon* @s, i32 0, i32 1), align 8
  %arrayidx3 = getelementptr inbounds i8* %4, i64 %idxprom2
  store i8 0, i8* %arrayidx3, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}
