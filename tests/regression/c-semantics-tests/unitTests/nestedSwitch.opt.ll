; ModuleID = '/home/david/src/c-semantics/tests/unitTests/nestedSwitch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [4 x i8] c"one\00"
@str5 = private unnamed_addr constant [4 x i8] c"two\00"
@str6 = private unnamed_addr constant [8 x i8] c"default\00"
@str7 = private unnamed_addr constant [6 x i8] c"three\00"
@str8 = private unnamed_addr constant [12 x i8] c"sneaky four\00"

define i32 @main() nounwind uwtable {
for.inc.4:
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str6, i64 0, i64 0))
  %puts.1 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @str, i64 0, i64 0))
  %puts8.2 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @str5, i64 0, i64 0))
  %puts10.3 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str7, i64 0, i64 0))
  %puts11.4 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str8, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
