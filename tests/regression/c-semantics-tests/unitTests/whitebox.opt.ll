; ModuleID = '/home/david/src/c-semantics/tests/unitTests/whitebox.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %s = alloca %struct.bigstruct, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i32 4) nounwind
  %a = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 0
  store i32 1, i32* %a, align 8, !tbaa !0
  %b = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 1
  store i32 2, i32* %b, align 4, !tbaa !0
  %c = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 2
  store i32 3, i32* %c, align 8, !tbaa !0
  %d = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 4
  store i32 4, i32* %d, align 8, !tbaa !0
  %e = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 5
  store i32 5, i32* %e, align 4, !tbaa !0
  %f = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 6
  store i32 6, i32* %f, align 8, !tbaa !0
  %p9 = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 3
  store i32* %b, i32** %p9, align 8, !tbaa !3
  %this = getelementptr inbounds %struct.bigstruct* %s, i64 0, i32 7
  store %struct.bigstruct* %s, %struct.bigstruct** %this, align 8, !tbaa !3
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 6) nounwind
  %0 = load %struct.bigstruct** %this, align 8, !tbaa !3
  %p12 = getelementptr inbounds %struct.bigstruct* %0, i64 0, i32 3
  %1 = load i32** %p12, align 8, !tbaa !3
  %2 = load i32* %1, align 4, !tbaa !0
  %3 = load i32* %b, align 4, !tbaa !0
  %4 = load i32* %e, align 4, !tbaa !0
  %5 = load i32* %f, align 8, !tbaa !0
  %inc21 = add nsw i32 %2, 1
  store i32 %inc21, i32* %1, align 4, !tbaa !0
  %6 = load i32* %b, align 4, !tbaa !0
  %add = add i32 %2, 6
  %add17 = add i32 %add, %3
  %add15 = add i32 %add17, %4
  %add18 = add i32 %add15, %5
  %add23 = add i32 %add18, %6
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), i32 %add23) nounwind
  %add27 = add nsw i32 %add23, 2
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str17, i64 0, i64 0), i32 %add27) nounwind
  %putchar = call i32 @putchar(i32 10) nounwind
  %puts = call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @.str4, i64 0, i64 0))
  %puts89 = call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str5, i64 0, i64 0))
  %inc34 = add nsw i32 %add23, 3
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str19, i64 0, i64 0), i32 %inc34) nounwind
  %add87 = add nsw i32 %add23, 44
  %call88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i32 %add87) nounwind
  ret i32 %add87
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
