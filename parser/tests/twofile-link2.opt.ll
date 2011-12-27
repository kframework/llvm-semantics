; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/twofile-link2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@f.r = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [11 x i8] c"  2z = %d\0A\00", align 1
@z = common global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"  2w = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"  2r = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"  2c = %d\0A\00", align 1
@c = external global i32
@.str4 = private unnamed_addr constant [14 x i8] c"  2g(5) = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"  2v = %d\0A\00", align 1

define i32 @f(i32 %x, i32 %y) nounwind uwtable {
entry:
  %tmp = load i32* @f.r, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @f.r, align 4
  %tmp2 = load i32* @z, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %tmp2) nounwind
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 13) nounwind
  %tmp5 = load i32* @f.r, align 4
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = load i32* @c, align 4
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i32 %tmp7) nounwind
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str4, i64 0, i64 0), i32 25) nounwind
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), i32 1800) nounwind
  %mul14 = shl i32 %x, 1
  %add = add nsw i32 %mul14, %y
  ret i32 %add
}

declare i32 @printf(i8* nocapture, ...) nounwind
