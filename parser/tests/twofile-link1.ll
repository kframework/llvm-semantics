; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/twofile-link1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@z = global i32 5, align 4
@q = global i32 3, align 4
@c = global i32 32, align 4
@r = global i32 77, align 4
@.str = private unnamed_addr constant [11 x i8] c"1zza = %d\0A\00", align 1
@zz = internal global i32 0, align 4
@main.zz = internal global i32 5, align 4
@.str1 = private unnamed_addr constant [9 x i8] c"1z = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"1w = %d\0A\00", align 1
@w = internal global i32 7, align 4
@.str3 = private unnamed_addr constant [9 x i8] c"1q = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"1r = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"1v = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [11 x i8] c"1zzb = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"1g(5) = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [13 x i8] c"f(2, 3)==%d\0A\00", align 1
@.str9 = private unnamed_addr constant [21 x i8] c"f(2, 3) should be 7\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %q = alloca i32, align 4
  %v = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 4, i32* %q, align 4
  store i32 15, i32* %v, align 4
  %tmp = load i32* @zz, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp1 = load i32* @z, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %tmp1)
  %tmp3 = load i32* @w, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 %tmp3)
  %tmp5 = load i32* %q, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32 %tmp5)
  %tmp7 = load i32* @r, align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 %tmp7)
  %tmp9 = load i32* %v, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32 %tmp9)
  %tmp11 = load i32* @main.zz, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0), i32 %tmp11)
  %call13 = call i32 @g(i32 5)
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0), i32 %call13)
  %call15 = call i32 @f(i32 2, i32 3)
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str8, i32 0, i32 0), i32 %call15)
  %call17 = call i32 @f(i32 2, i32 3)
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str8, i32 0, i32 0), i32 %call17)
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str9, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)

define internal i32 @g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  ret i32 %tmp
}

declare i32 @f(i32, i32)
