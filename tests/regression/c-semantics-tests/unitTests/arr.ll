; ModuleID = '/home/david/src/c-semantics/tests/unitTests/arr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.point = type { i32, i32 }

@main.arr = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]], align 16
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 0) != 1\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 1) != 2\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 2) != 3\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 3) != 4\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"*((*(arr + 0)) + 0) != 1\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"*((*(arr + 0)) + 1) != 2\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"*((*(arr + 1)) + 0) != 3\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"*((*(arr + 1)) + 1) != 4\0A\00", align 1
@.str10 = private unnamed_addr constant [33 x i8] c"(*(pointArr + 3)).x != 7, == %d\0A\00", align 1
@.str11 = private unnamed_addr constant [33 x i8] c"(*(pointArr + 3)).y != 8, == %d\0A\00", align 1
@.str12 = private unnamed_addr constant [36 x i8] c"*((int*)(&(*(pointArr + 3)))) != 7\0A\00", align 1
@.str13 = private unnamed_addr constant [40 x i8] c"*((int*)(&(*(pointArr + 3))) + 1) != 8\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [2 x [2 x i32]], align 16
  %typetest = alloca i32, align 4
  %myintp = alloca i32*, align 8
  %bob = alloca i8*, align 8
  %pointArr = alloca [4 x %struct.point], align 16
  store i32 0, i32* %retval
  %0 = bitcast [2 x [2 x i32]]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x [2 x i32]]* @main.arr to i8*), i64 16, i32 16, i1 false)
  store i32 32, i32* %typetest, align 4
  %1 = bitcast [2 x [2 x i32]]* %arr to i32*
  store i32* %1, i32** %myintp, align 8
  store i32* %typetest, i32** %myintp, align 8
  store i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8** %bob, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %arraydecay = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %2 = bitcast [2 x i32]* %arraydecay to i32*
  %add.ptr = getelementptr inbounds i32* %2, i64 0
  %3 = load i32* %add.ptr, align 4
  %cmp = icmp ne i32 %3, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arraydecay7 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %4 = bitcast [2 x i32]* %arraydecay7 to i32*
  %add.ptr8 = getelementptr inbounds i32* %4, i64 1
  %5 = load i32* %add.ptr8, align 4
  %cmp9 = icmp ne i32 %5, 2
  br i1 %cmp9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.end
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  br label %if.end14

if.else12:                                        ; preds = %if.end
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end14

if.end14:                                         ; preds = %if.else12, %if.then10
  %arraydecay15 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %6 = bitcast [2 x i32]* %arraydecay15 to i32*
  %add.ptr16 = getelementptr inbounds i32* %6, i64 2
  %7 = load i32* %add.ptr16, align 4
  %cmp17 = icmp ne i32 %7, 3
  br i1 %cmp17, label %if.then18, label %if.else20

if.then18:                                        ; preds = %if.end14
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0))
  br label %if.end22

if.else20:                                        ; preds = %if.end14
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then18
  %arraydecay23 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %8 = bitcast [2 x i32]* %arraydecay23 to i32*
  %add.ptr24 = getelementptr inbounds i32* %8, i64 3
  %9 = load i32* %add.ptr24, align 4
  %cmp25 = icmp ne i32 %9, 4
  br i1 %cmp25, label %if.then26, label %if.else28

if.then26:                                        ; preds = %if.end22
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0))
  br label %if.end30

if.else28:                                        ; preds = %if.end22
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end30

if.end30:                                         ; preds = %if.else28, %if.then26
  %arraydecay31 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr32 = getelementptr inbounds [2 x i32]* %arraydecay31, i64 0
  %arraydecay33 = getelementptr inbounds [2 x i32]* %add.ptr32, i32 0, i32 0
  %add.ptr34 = getelementptr inbounds i32* %arraydecay33, i64 0
  %10 = load i32* %add.ptr34, align 4
  %cmp35 = icmp ne i32 %10, 1
  br i1 %cmp35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.end30
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0))
  br label %if.end40

if.else38:                                        ; preds = %if.end30
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end40

if.end40:                                         ; preds = %if.else38, %if.then36
  %arraydecay41 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr42 = getelementptr inbounds [2 x i32]* %arraydecay41, i64 0
  %arraydecay43 = getelementptr inbounds [2 x i32]* %add.ptr42, i32 0, i32 0
  %add.ptr44 = getelementptr inbounds i32* %arraydecay43, i64 1
  %11 = load i32* %add.ptr44, align 4
  %cmp45 = icmp ne i32 %11, 2
  br i1 %cmp45, label %if.then46, label %if.else48

if.then46:                                        ; preds = %if.end40
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0))
  br label %if.end50

if.else48:                                        ; preds = %if.end40
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end50

if.end50:                                         ; preds = %if.else48, %if.then46
  %arraydecay51 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr52 = getelementptr inbounds [2 x i32]* %arraydecay51, i64 1
  %arraydecay53 = getelementptr inbounds [2 x i32]* %add.ptr52, i32 0, i32 0
  %add.ptr54 = getelementptr inbounds i32* %arraydecay53, i64 0
  %12 = load i32* %add.ptr54, align 4
  %cmp55 = icmp ne i32 %12, 3
  br i1 %cmp55, label %if.then56, label %if.else58

if.then56:                                        ; preds = %if.end50
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0))
  br label %if.end60

if.else58:                                        ; preds = %if.end50
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.then56
  %arraydecay61 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr62 = getelementptr inbounds [2 x i32]* %arraydecay61, i64 1
  %arraydecay63 = getelementptr inbounds [2 x i32]* %add.ptr62, i32 0, i32 0
  %add.ptr64 = getelementptr inbounds i32* %arraydecay63, i64 1
  %13 = load i32* %add.ptr64, align 4
  %cmp65 = icmp ne i32 %13, 4
  br i1 %cmp65, label %if.then66, label %if.else68

if.then66:                                        ; preds = %if.end60
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0))
  br label %if.end70

if.else68:                                        ; preds = %if.end60
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end70

if.end70:                                         ; preds = %if.else68, %if.then66
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %call72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %arrayidx = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 0
  %x = getelementptr inbounds %struct.point* %arrayidx, i32 0, i32 0
  store i32 1, i32* %x, align 4
  %arrayidx73 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 0
  %y = getelementptr inbounds %struct.point* %arrayidx73, i32 0, i32 1
  store i32 2, i32* %y, align 4
  %arrayidx74 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 1
  %x75 = getelementptr inbounds %struct.point* %arrayidx74, i32 0, i32 0
  store i32 3, i32* %x75, align 4
  %arrayidx76 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 1
  %y77 = getelementptr inbounds %struct.point* %arrayidx76, i32 0, i32 1
  store i32 4, i32* %y77, align 4
  %arrayidx78 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 2
  %x79 = getelementptr inbounds %struct.point* %arrayidx78, i32 0, i32 0
  store i32 5, i32* %x79, align 4
  %arrayidx80 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 2
  %y81 = getelementptr inbounds %struct.point* %arrayidx80, i32 0, i32 1
  store i32 6, i32* %y81, align 4
  %arrayidx82 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 3
  %x83 = getelementptr inbounds %struct.point* %arrayidx82, i32 0, i32 0
  store i32 7, i32* %x83, align 4
  %arrayidx84 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 3
  %y85 = getelementptr inbounds %struct.point* %arrayidx84, i32 0, i32 1
  store i32 8, i32* %y85, align 4
  %arraydecay86 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr87 = getelementptr inbounds %struct.point* %arraydecay86, i64 3
  %x88 = getelementptr inbounds %struct.point* %add.ptr87, i32 0, i32 0
  %14 = load i32* %x88, align 4
  %cmp89 = icmp ne i32 %14, 7
  br i1 %cmp89, label %if.then90, label %if.else95

if.then90:                                        ; preds = %if.end70
  %arraydecay91 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr92 = getelementptr inbounds %struct.point* %arraydecay91, i64 3
  %x93 = getelementptr inbounds %struct.point* %add.ptr92, i32 0, i32 0
  %15 = load i32* %x93, align 4
  %call94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str10, i32 0, i32 0), i32 %15)
  br label %if.end97

if.else95:                                        ; preds = %if.end70
  %call96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end97

if.end97:                                         ; preds = %if.else95, %if.then90
  %arraydecay98 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr99 = getelementptr inbounds %struct.point* %arraydecay98, i64 3
  %y100 = getelementptr inbounds %struct.point* %add.ptr99, i32 0, i32 1
  %16 = load i32* %y100, align 4
  %cmp101 = icmp ne i32 %16, 8
  br i1 %cmp101, label %if.then102, label %if.else107

if.then102:                                       ; preds = %if.end97
  %arraydecay103 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr104 = getelementptr inbounds %struct.point* %arraydecay103, i64 3
  %y105 = getelementptr inbounds %struct.point* %add.ptr104, i32 0, i32 1
  %17 = load i32* %y105, align 4
  %call106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str11, i32 0, i32 0), i32 %17)
  br label %if.end109

if.else107:                                       ; preds = %if.end97
  %call108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end109

if.end109:                                        ; preds = %if.else107, %if.then102
  %arraydecay110 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr111 = getelementptr inbounds %struct.point* %arraydecay110, i64 3
  %18 = bitcast %struct.point* %add.ptr111 to i32*
  %19 = load i32* %18, align 4
  %cmp112 = icmp ne i32 %19, 7
  br i1 %cmp112, label %if.then113, label %if.else115

if.then113:                                       ; preds = %if.end109
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str12, i32 0, i32 0))
  br label %if.end117

if.else115:                                       ; preds = %if.end109
  %call116 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end117

if.end117:                                        ; preds = %if.else115, %if.then113
  %arraydecay118 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr119 = getelementptr inbounds %struct.point* %arraydecay118, i64 3
  %20 = bitcast %struct.point* %add.ptr119 to i32*
  %add.ptr120 = getelementptr inbounds i32* %20, i64 1
  %21 = load i32* %add.ptr120, align 4
  %cmp121 = icmp ne i32 %21, 8
  br i1 %cmp121, label %if.then122, label %if.else124

if.then122:                                       ; preds = %if.end117
  %call123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str13, i32 0, i32 0))
  br label %if.end126

if.else124:                                       ; preds = %if.end117
  %call125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %if.end126

if.end126:                                        ; preds = %if.else124, %if.then122
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
