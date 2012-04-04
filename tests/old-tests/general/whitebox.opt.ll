; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/whitebox.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.bigstruct = type { i32, i32, i32, i32*, i32, i32, i32, %struct.bigstruct* }

@.str = private unnamed_addr constant [5 x i8] c"w%d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"y%d\0A\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"zc%d\0A\00", align 1
@.str4 = private unnamed_addr constant [33 x i8] c"d41d8cd98f00b204e9800998ecf8427e\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str17 = private unnamed_addr constant [6 x i8] c"za%d\0A\00", align 1
@.str19 = private unnamed_addr constant [6 x i8] c"zb%d\0A\00", align 1
@.str20 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %s = alloca %struct.bigstruct, align 8
  store i32 4, i32* %x, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i32 4) nounwind
  %tmp18 = load i32* %x, align 4
  %inc25 = add i32 %tmp18, 2
  store i32 %inc25, i32* %x, align 4
  %a = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 0
  store i32 1, i32* %a, align 8
  %b = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 1
  store i32 2, i32* %b, align 4
  %c = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 2
  store i32 3, i32* %c, align 8
  %d = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 4
  store i32 4, i32* %d, align 8
  %e = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 5
  store i32 5, i32* %e, align 4
  %f = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 6
  store i32 6, i32* %f, align 8
  %p29 = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 3
  store i32* %b, i32** %p29, align 8
  %this = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 7
  store %struct.bigstruct* %s, %struct.bigstruct** %this, align 8
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 %inc25) nounwind
  %tmp33 = load %struct.bigstruct** %this, align 8
  %p34 = getelementptr inbounds %struct.bigstruct* %tmp33, i64 0, i32 3
  %tmp35 = load i32** %p34, align 8
  %tmp36 = load i32* %tmp35, align 4
  %tmp37 = load i32* %x, align 4
  %add = add nsw i32 %tmp37, %tmp36
  %tmp39 = load i32* %b, align 4
  %tmp41 = load i32* %e, align 4
  %tmp44 = load i32* %f, align 8
  %add42 = add i32 %tmp39, %add
  %add45 = add i32 %add42, %tmp41
  %add47 = add i32 %add45, %tmp44
  store i32 %add47, i32* %x, align 4
  %tmp52 = load i32* %tmp35, align 4
  %inc53 = add nsw i32 %tmp52, 1
  store i32 %inc53, i32* %tmp35, align 4
  %tmp55 = load i32* %b, align 4
  %tmp56 = load i32* %x, align 4
  %add57 = add nsw i32 %tmp56, %tmp55
  store i32 %add57, i32* %x, align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), i32 %add57) nounwind
  %tmp64 = load i32* %x, align 4
  %add65 = add nsw i32 %tmp64, 2
  store i32 %add65, i32* %x, align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str17, i64 0, i64 0), i32 %add65) nounwind
  %putchar = call i32 @putchar(i32 10) nounwind
  %puts = call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @.str4, i64 0, i64 0))
  %puts8 = call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str5, i64 0, i64 0))
  %tmp78 = load i32* %x, align 4
  %inc79 = add nsw i32 %tmp78, 1
  store i32 %inc79, i32* %x, align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str19, i64 0, i64 0), i32 %inc79) nounwind
  %x.promoted = load i32* %x, align 4
  %add155 = add i32 %x.promoted, 41
  store i32 %add155, i32* %x, align 4
  %call157 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i32 %add155) nounwind
  %tmp158 = load i32* %x, align 4
  ret i32 %tmp158
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)
