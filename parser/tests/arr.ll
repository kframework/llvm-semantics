; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/arr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.point = type { i32, i32 }

@main.arr = internal unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]], align 16
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str1 = private unnamed_addr constant [13 x i8] c"&arr != arr\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"&arr[0] != arr\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"&*(arr + 0) != arr\0A\00", align 1
@.str5 = private unnamed_addr constant [16 x i8] c"arr + 0 != arr\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"&(*(*(arr + 0) + 0)) != arr\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 0) != 1\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 1) != 2\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 2) != 3\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 3) != 4\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"*((*(arr + 0)) + 0) != 1\0A\00", align 1
@.str12 = private unnamed_addr constant [26 x i8] c"*((*(arr + 0)) + 1) != 2\0A\00", align 1
@.str13 = private unnamed_addr constant [26 x i8] c"*((*(arr + 1)) + 0) != 3\0A\00", align 1
@.str14 = private unnamed_addr constant [26 x i8] c"*((*(arr + 1)) + 1) != 4\0A\00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"&arr[0] != &arr[0][0]\0A\00", align 1
@.str16 = private unnamed_addr constant [23 x i8] c"&arr[1] != &arr[1][0]\0A\00", align 1
@.str17 = private unnamed_addr constant [33 x i8] c"(*(pointArr + 3)).x != 7, == %d\0A\00", align 1
@.str18 = private unnamed_addr constant [33 x i8] c"(*(pointArr + 3)).y != 8, == %d\0A\00", align 1
@.str19 = private unnamed_addr constant [36 x i8] c"*((int*)(&(*(pointArr + 3)))) != 7\0A\00", align 1
@.str20 = private unnamed_addr constant [40 x i8] c"*((int*)(&(*(pointArr + 3))) + 1) != 8\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [2 x [2 x i32]], align 16
  %typetest = alloca i32, align 4
  %myintp = alloca i32*, align 8
  %bob = alloca i8*, align 8
  %pointArr = alloca [4 x %struct.point], align 16
  store i32 0, i32* %retval
  %tmp = bitcast [2 x [2 x i32]]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([2 x [2 x i32]]* @main.arr to i8*), i64 16, i32 16, i1 false)
  store i32 32, i32* %typetest, align 4
  %0 = bitcast [2 x [2 x i32]]* %arr to i32*
  store i32* %0, i32** %myintp, align 8
  store i32* %typetest, i32** %myintp, align 8
  store i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8** %bob, align 8
  %1 = bitcast [2 x [2 x i32]]* %arr to i32*
  %arraydecay = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %2 = bitcast [2 x i32]* %arraydecay to i32*
  %cmp = icmp ne i32* %1, %2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arrayidx = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i64 0
  %3 = bitcast [2 x i32]* %arrayidx to i32*
  %arraydecay5 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %4 = bitcast [2 x i32]* %arraydecay5 to i32*
  %cmp6 = icmp ne i32* %3, %4
  br i1 %cmp6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.end
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0))
  br label %if.end11

if.else9:                                         ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else9, %if.then7
  %arraydecay12 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr = getelementptr inbounds [2 x i32]* %arraydecay12, i64 0
  %5 = bitcast [2 x i32]* %add.ptr to i32*
  %arraydecay13 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %6 = bitcast [2 x i32]* %arraydecay13 to i32*
  %cmp14 = icmp ne i32* %5, %6
  br i1 %cmp14, label %if.then15, label %if.else17

if.then15:                                        ; preds = %if.end11
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0))
  br label %if.end19

if.else17:                                        ; preds = %if.end11
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end19

if.end19:                                         ; preds = %if.else17, %if.then15
  %arraydecay20 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr21 = getelementptr inbounds [2 x i32]* %arraydecay20, i64 0
  %7 = bitcast [2 x i32]* %add.ptr21 to i32*
  %arraydecay22 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %8 = bitcast [2 x i32]* %arraydecay22 to i32*
  %cmp23 = icmp ne i32* %7, %8
  br i1 %cmp23, label %if.then24, label %if.else26

if.then24:                                        ; preds = %if.end19
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str5, i32 0, i32 0))
  br label %if.end28

if.else26:                                        ; preds = %if.end19
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end28

if.end28:                                         ; preds = %if.else26, %if.then24
  %arraydecay29 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr30 = getelementptr inbounds [2 x i32]* %arraydecay29, i64 0
  %arraydecay31 = getelementptr inbounds [2 x i32]* %add.ptr30, i32 0, i32 0
  %add.ptr32 = getelementptr inbounds i32* %arraydecay31, i64 0
  %arraydecay33 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %9 = bitcast [2 x i32]* %arraydecay33 to i32*
  %cmp34 = icmp ne i32* %add.ptr32, %9
  br i1 %cmp34, label %if.then35, label %if.else37

if.then35:                                        ; preds = %if.end28
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0))
  br label %if.end39

if.else37:                                        ; preds = %if.end28
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end39

if.end39:                                         ; preds = %if.else37, %if.then35
  %arraydecay40 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %10 = bitcast [2 x i32]* %arraydecay40 to i32*
  %add.ptr41 = getelementptr inbounds i32* %10, i64 0
  %tmp42 = load i32* %add.ptr41
  %cmp43 = icmp ne i32 %tmp42, 1
  br i1 %cmp43, label %if.then44, label %if.else46

if.then44:                                        ; preds = %if.end39
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0))
  br label %if.end48

if.else46:                                        ; preds = %if.end39
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end48

if.end48:                                         ; preds = %if.else46, %if.then44
  %arraydecay49 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %11 = bitcast [2 x i32]* %arraydecay49 to i32*
  %add.ptr50 = getelementptr inbounds i32* %11, i64 1
  %tmp51 = load i32* %add.ptr50
  %cmp52 = icmp ne i32 %tmp51, 2
  br i1 %cmp52, label %if.then53, label %if.else55

if.then53:                                        ; preds = %if.end48
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0))
  br label %if.end57

if.else55:                                        ; preds = %if.end48
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end57

if.end57:                                         ; preds = %if.else55, %if.then53
  %arraydecay58 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %12 = bitcast [2 x i32]* %arraydecay58 to i32*
  %add.ptr59 = getelementptr inbounds i32* %12, i64 2
  %tmp60 = load i32* %add.ptr59
  %cmp61 = icmp ne i32 %tmp60, 3
  br i1 %cmp61, label %if.then62, label %if.else64

if.then62:                                        ; preds = %if.end57
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0))
  br label %if.end66

if.else64:                                        ; preds = %if.end57
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end66

if.end66:                                         ; preds = %if.else64, %if.then62
  %arraydecay67 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %13 = bitcast [2 x i32]* %arraydecay67 to i32*
  %add.ptr68 = getelementptr inbounds i32* %13, i64 3
  %tmp69 = load i32* %add.ptr68
  %cmp70 = icmp ne i32 %tmp69, 4
  br i1 %cmp70, label %if.then71, label %if.else73

if.then71:                                        ; preds = %if.end66
  %call72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0))
  br label %if.end75

if.else73:                                        ; preds = %if.end66
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end75

if.end75:                                         ; preds = %if.else73, %if.then71
  %arraydecay76 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr77 = getelementptr inbounds [2 x i32]* %arraydecay76, i64 0
  %arraydecay78 = getelementptr inbounds [2 x i32]* %add.ptr77, i32 0, i32 0
  %add.ptr79 = getelementptr inbounds i32* %arraydecay78, i64 0
  %tmp80 = load i32* %add.ptr79
  %cmp81 = icmp ne i32 %tmp80, 1
  br i1 %cmp81, label %if.then82, label %if.else84

if.then82:                                        ; preds = %if.end75
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str11, i32 0, i32 0))
  br label %if.end86

if.else84:                                        ; preds = %if.end75
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end86

if.end86:                                         ; preds = %if.else84, %if.then82
  %arraydecay87 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr88 = getelementptr inbounds [2 x i32]* %arraydecay87, i64 0
  %arraydecay89 = getelementptr inbounds [2 x i32]* %add.ptr88, i32 0, i32 0
  %add.ptr90 = getelementptr inbounds i32* %arraydecay89, i64 1
  %tmp91 = load i32* %add.ptr90
  %cmp92 = icmp ne i32 %tmp91, 2
  br i1 %cmp92, label %if.then93, label %if.else95

if.then93:                                        ; preds = %if.end86
  %call94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str12, i32 0, i32 0))
  br label %if.end97

if.else95:                                        ; preds = %if.end86
  %call96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end97

if.end97:                                         ; preds = %if.else95, %if.then93
  %arraydecay98 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr99 = getelementptr inbounds [2 x i32]* %arraydecay98, i64 1
  %arraydecay100 = getelementptr inbounds [2 x i32]* %add.ptr99, i32 0, i32 0
  %add.ptr101 = getelementptr inbounds i32* %arraydecay100, i64 0
  %tmp102 = load i32* %add.ptr101
  %cmp103 = icmp ne i32 %tmp102, 3
  br i1 %cmp103, label %if.then104, label %if.else106

if.then104:                                       ; preds = %if.end97
  %call105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str13, i32 0, i32 0))
  br label %if.end108

if.else106:                                       ; preds = %if.end97
  %call107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end108

if.end108:                                        ; preds = %if.else106, %if.then104
  %arraydecay109 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %add.ptr110 = getelementptr inbounds [2 x i32]* %arraydecay109, i64 1
  %arraydecay111 = getelementptr inbounds [2 x i32]* %add.ptr110, i32 0, i32 0
  %add.ptr112 = getelementptr inbounds i32* %arraydecay111, i64 1
  %tmp113 = load i32* %add.ptr112
  %cmp114 = icmp ne i32 %tmp113, 4
  br i1 %cmp114, label %if.then115, label %if.else117

if.then115:                                       ; preds = %if.end108
  %call116 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str14, i32 0, i32 0))
  br label %if.end119

if.else117:                                       ; preds = %if.end108
  %call118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end119

if.end119:                                        ; preds = %if.else117, %if.then115
  %arrayidx120 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i64 0
  %14 = bitcast [2 x i32]* %arrayidx120 to i32*
  %arrayidx121 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i64 0
  %arrayidx122 = getelementptr inbounds [2 x i32]* %arrayidx121, i32 0, i64 0
  %cmp123 = icmp ne i32* %14, %arrayidx122
  br i1 %cmp123, label %if.then124, label %if.else126

if.then124:                                       ; preds = %if.end119
  %call125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0))
  br label %if.end128

if.else126:                                       ; preds = %if.end119
  %call127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end128

if.end128:                                        ; preds = %if.else126, %if.then124
  %arrayidx129 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i64 1
  %15 = bitcast [2 x i32]* %arrayidx129 to i32*
  %arrayidx130 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i64 1
  %arrayidx131 = getelementptr inbounds [2 x i32]* %arrayidx130, i32 0, i64 0
  %cmp132 = icmp ne i32* %15, %arrayidx131
  br i1 %cmp132, label %if.then133, label %if.else135

if.then133:                                       ; preds = %if.end128
  %call134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str16, i32 0, i32 0))
  br label %if.end137

if.else135:                                       ; preds = %if.end128
  %call136 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end137

if.end137:                                        ; preds = %if.else135, %if.then133
  %arrayidx139 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 0
  %x = getelementptr inbounds %struct.point* %arrayidx139, i32 0, i32 0
  store i32 1, i32* %x, align 4
  %arrayidx140 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 0
  %y = getelementptr inbounds %struct.point* %arrayidx140, i32 0, i32 1
  store i32 2, i32* %y, align 4
  %arrayidx141 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 1
  %x142 = getelementptr inbounds %struct.point* %arrayidx141, i32 0, i32 0
  store i32 3, i32* %x142, align 4
  %arrayidx143 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 1
  %y144 = getelementptr inbounds %struct.point* %arrayidx143, i32 0, i32 1
  store i32 4, i32* %y144, align 4
  %arrayidx145 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 2
  %x146 = getelementptr inbounds %struct.point* %arrayidx145, i32 0, i32 0
  store i32 5, i32* %x146, align 4
  %arrayidx147 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 2
  %y148 = getelementptr inbounds %struct.point* %arrayidx147, i32 0, i32 1
  store i32 6, i32* %y148, align 4
  %arrayidx149 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 3
  %x150 = getelementptr inbounds %struct.point* %arrayidx149, i32 0, i32 0
  store i32 7, i32* %x150, align 4
  %arrayidx151 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 3
  %y152 = getelementptr inbounds %struct.point* %arrayidx151, i32 0, i32 1
  store i32 8, i32* %y152, align 4
  %arraydecay153 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr154 = getelementptr inbounds %struct.point* %arraydecay153, i64 3
  %x155 = getelementptr inbounds %struct.point* %add.ptr154, i32 0, i32 0
  %tmp156 = load i32* %x155, align 4
  %cmp157 = icmp ne i32 %tmp156, 7
  br i1 %cmp157, label %if.then158, label %if.else164

if.then158:                                       ; preds = %if.end137
  %arraydecay159 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr160 = getelementptr inbounds %struct.point* %arraydecay159, i64 3
  %x161 = getelementptr inbounds %struct.point* %add.ptr160, i32 0, i32 0
  %tmp162 = load i32* %x161, align 4
  %call163 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str17, i32 0, i32 0), i32 %tmp162)
  br label %if.end166

if.else164:                                       ; preds = %if.end137
  %call165 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end166

if.end166:                                        ; preds = %if.else164, %if.then158
  %arraydecay167 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr168 = getelementptr inbounds %struct.point* %arraydecay167, i64 3
  %y169 = getelementptr inbounds %struct.point* %add.ptr168, i32 0, i32 1
  %tmp170 = load i32* %y169, align 4
  %cmp171 = icmp ne i32 %tmp170, 8
  br i1 %cmp171, label %if.then172, label %if.else178

if.then172:                                       ; preds = %if.end166
  %arraydecay173 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr174 = getelementptr inbounds %struct.point* %arraydecay173, i64 3
  %y175 = getelementptr inbounds %struct.point* %add.ptr174, i32 0, i32 1
  %tmp176 = load i32* %y175, align 4
  %call177 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str18, i32 0, i32 0), i32 %tmp176)
  br label %if.end180

if.else178:                                       ; preds = %if.end166
  %call179 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end180

if.end180:                                        ; preds = %if.else178, %if.then172
  %arraydecay181 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr182 = getelementptr inbounds %struct.point* %arraydecay181, i64 3
  %16 = bitcast %struct.point* %add.ptr182 to i32*
  %tmp183 = load i32* %16
  %cmp184 = icmp ne i32 %tmp183, 7
  br i1 %cmp184, label %if.then185, label %if.else187

if.then185:                                       ; preds = %if.end180
  %call186 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str19, i32 0, i32 0))
  br label %if.end189

if.else187:                                       ; preds = %if.end180
  %call188 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end189

if.end189:                                        ; preds = %if.else187, %if.then185
  %arraydecay190 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %add.ptr191 = getelementptr inbounds %struct.point* %arraydecay190, i64 3
  %17 = bitcast %struct.point* %add.ptr191 to i32*
  %add.ptr192 = getelementptr inbounds i32* %17, i64 1
  %tmp193 = load i32* %add.ptr192
  %cmp194 = icmp ne i32 %tmp193, 8
  br i1 %cmp194, label %if.then195, label %if.else197

if.then195:                                       ; preds = %if.end189
  %call196 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str20, i32 0, i32 0))
  br label %if.end199

if.else197:                                       ; preds = %if.end189
  %call198 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  br label %if.end199

if.end199:                                        ; preds = %if.else197, %if.then195
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
