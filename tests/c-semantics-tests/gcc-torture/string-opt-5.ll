; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/string-opt-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global i32 6, align 4
@y = global i32 1, align 4
@.str = private unnamed_addr constant [9 x i8] c"hi world\00", align 1
@bar = global i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), align 8
@.str1 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"lo world\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"ello world\00", align 1
@.str4 = private unnamed_addr constant [6 x i8] c"ello \00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"foo\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c" oo\00\00\00\00\00\00\00\00 \00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str8 = private unnamed_addr constant [10 x i8] c"hello\00\00\00 \00", align 1
@buf = common global [64 x i8] zeroinitializer, align 16
@.str9 = private unnamed_addr constant [4 x i8] c"!!!\00", align 1
@.str10 = private unnamed_addr constant [12 x i8] c"!!!--------\00", align 1
@.str11 = private unnamed_addr constant [7 x i8] c"---\00\00\00\00", align 1
@.str12 = private unnamed_addr constant [11 x i8] c"-\00\00\00\00\00\00\00\00\00\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %foo = alloca i8*, align 8
  %dst = alloca [64 x i8], align 16
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i8** %foo, align 8
  %0 = load i8** @bar, align 8
  %call = call i64 @strlen(i8* %0)
  %cmp = icmp ne i64 %call, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i8** @bar, align 8
  %2 = load i32* @x, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @x, align 4
  %and = and i32 %inc, 2
  %idx.ext = sext i32 %and to i64
  %add.ptr = getelementptr inbounds i8* %1, i64 %idx.ext
  %call1 = call i64 @strlen(i8* %add.ptr)
  %cmp2 = icmp ne i64 %call1, 6
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %3 = load i32* @x, align 4
  %cmp5 = icmp ne i32 %3, 7
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end4
  %4 = load i8** %foo, align 8
  %5 = load i32* @x, align 4
  %inc8 = add nsw i32 %5, 1
  store i32 %inc8, i32* @x, align 4
  %add.ptr9 = getelementptr inbounds i8* %4, i64 6
  %call10 = call i64 @strlen(i8* %add.ptr9)
  %cmp11 = icmp ne i64 %call10, 5
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end7
  %6 = load i32* @x, align 4
  %cmp14 = icmp ne i32 %6, 8
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end13
  %7 = load i8** %foo, align 8
  %8 = load i32* @x, align 4
  %inc17 = add nsw i32 %8, 1
  store i32 %inc17, i32* @x, align 4
  %and18 = and i32 %inc17, 1
  %idx.ext19 = sext i32 %and18 to i64
  %add.ptr20 = getelementptr inbounds i8* %7, i64 %idx.ext19
  %call21 = call i64 @strlen(i8* %add.ptr20)
  %cmp22 = icmp ne i64 %call21, 10
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end16
  %9 = load i32* @x, align 4
  %cmp25 = icmp ne i32 %9, 9
  br i1 %cmp25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end24
  %10 = load i8** %foo, align 8
  %11 = load i32* @x, align 4
  %sub = sub nsw i32 %11, 6
  store i32 %sub, i32* @x, align 4
  %idx.ext28 = sext i32 %sub to i64
  %add.ptr29 = getelementptr inbounds i8* %10, i64 %idx.ext28
  %call30 = call i32 @strcmp(i8* %add.ptr29, i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  %tobool = icmp ne i32 %call30, 0
  br i1 %tobool, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end27
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end27
  %12 = load i32* @x, align 4
  %cmp33 = icmp ne i32 %12, 3
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %if.end32
  %13 = load i8** %foo, align 8
  %14 = load i8** @bar, align 8
  %call36 = call i32 @strcmp(i8* %13, i8* %14)
  %cmp37 = icmp sge i32 %call36, 0
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.end35
  %15 = load i8** %foo, align 8
  %16 = load i8** @bar, align 8
  %17 = load i32* @x, align 4
  %inc40 = add nsw i32 %17, 1
  store i32 %inc40, i32* @x, align 4
  %and41 = and i32 %17, 1
  %idx.ext42 = sext i32 %and41 to i64
  %add.ptr43 = getelementptr inbounds i8* %16, i64 %idx.ext42
  %call44 = call i32 @strcmp(i8* %15, i8* %add.ptr43)
  %cmp45 = icmp sge i32 %call44, 0
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end39
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end39
  %18 = load i32* @x, align 4
  %cmp48 = icmp ne i32 %18, 4
  br i1 %cmp48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end47
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.end47
  %19 = load i8** %foo, align 8
  %20 = load i32* @x, align 4
  %inc51 = add nsw i32 %20, 1
  store i32 %inc51, i32* @x, align 4
  %and52 = and i32 %20, 7
  %idx.ext53 = sext i32 %and52 to i64
  %add.ptr54 = getelementptr inbounds i8* %19, i64 %idx.ext53
  %call55 = call i8* @strchr(i8* %add.ptr54, i32 108)
  %21 = load i8** %foo, align 8
  %add.ptr56 = getelementptr inbounds i8* %21, i64 9
  %cmp57 = icmp ne i8* %call55, %add.ptr56
  br i1 %cmp57, label %if.then58, label %if.end59

if.then58:                                        ; preds = %if.end50
  call void @abort() noreturn nounwind
  unreachable

if.end59:                                         ; preds = %if.end50
  %22 = load i32* @x, align 4
  %cmp60 = icmp ne i32 %22, 5
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end59
  call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %if.end59
  %23 = load i8** @bar, align 8
  %call63 = call i8* @strchr(i8* %23, i32 111)
  %24 = load i8** @bar, align 8
  %add.ptr64 = getelementptr inbounds i8* %24, i64 4
  %cmp65 = icmp ne i8* %call63, %add.ptr64
  br i1 %cmp65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end62
  call void @abort() noreturn nounwind
  unreachable

if.end67:                                         ; preds = %if.end62
  %25 = load i8** @bar, align 8
  %call68 = call i8* @strchr(i8* %25, i32 0)
  %26 = load i8** @bar, align 8
  %add.ptr69 = getelementptr inbounds i8* %26, i64 8
  %cmp70 = icmp ne i8* %call68, %add.ptr69
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end67
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end67
  %27 = load i8** @bar, align 8
  %call73 = call i8* @strrchr(i8* %27, i32 120)
  %tobool74 = icmp ne i8* %call73, null
  br i1 %tobool74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %28 = load i8** @bar, align 8
  %call77 = call i8* @strrchr(i8* %28, i32 111)
  %29 = load i8** @bar, align 8
  %add.ptr78 = getelementptr inbounds i8* %29, i64 4
  %cmp79 = icmp ne i8* %call77, %add.ptr78
  br i1 %cmp79, label %if.then80, label %if.end81

if.then80:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end81:                                         ; preds = %if.end76
  %30 = load i8** %foo, align 8
  %31 = load i32* @x, align 4
  %inc82 = add nsw i32 %31, 1
  store i32 %inc82, i32* @x, align 4
  %and83 = and i32 %31, 1
  %idx.ext84 = sext i32 %and83 to i64
  %add.ptr85 = getelementptr inbounds i8* %30, i64 %idx.ext84
  %32 = load i32* @y, align 4
  %dec = add nsw i32 %32, -1
  store i32 %dec, i32* @y, align 4
  %and86 = and i32 %dec, 1
  %idx.ext87 = sext i32 %and86 to i64
  %add.ptr88 = getelementptr inbounds i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i64 %idx.ext87
  %call89 = call i32 @strcmp(i8* %add.ptr85, i8* %add.ptr88)
  %tobool90 = icmp ne i32 %call89, 0
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end81
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end81
  %33 = load i32* @x, align 4
  %cmp93 = icmp ne i32 %33, 6
  br i1 %cmp93, label %if.then95, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end92
  %34 = load i32* @y, align 4
  %cmp94 = icmp ne i32 %34, 0
  br i1 %cmp94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %lor.lhs.false, %if.end92
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %lor.lhs.false
  %arrayidx = getelementptr inbounds [64 x i8]* %dst, i32 0, i64 5
  store i8 32, i8* %arrayidx, align 1
  %arrayidx97 = getelementptr inbounds [64 x i8]* %dst, i32 0, i64 6
  store i8 0, i8* %arrayidx97, align 1
  store i32 5, i32* @x, align 4
  store i32 1, i32* @y, align 4
  %arraydecay = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr98 = getelementptr inbounds i8* %arraydecay, i64 1
  %35 = load i8** %foo, align 8
  %36 = load i32* @x, align 4
  %inc99 = add nsw i32 %36, 1
  store i32 %inc99, i32* @x, align 4
  %and100 = and i32 %36, 3
  %idx.ext101 = sext i32 %and100 to i64
  %add.ptr102 = getelementptr inbounds i8* %35, i64 %idx.ext101
  %call103 = call i8* @strncpy(i8* %add.ptr98, i8* %add.ptr102, i64 4)
  %arraydecay104 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr105 = getelementptr inbounds i8* %arraydecay104, i64 1
  %cmp106 = icmp ne i8* %call103, %add.ptr105
  br i1 %cmp106, label %if.then114, label %lor.lhs.false107

lor.lhs.false107:                                 ; preds = %if.end96
  %37 = load i32* @x, align 4
  %cmp108 = icmp ne i32 %37, 6
  br i1 %cmp108, label %if.then114, label %lor.lhs.false109

lor.lhs.false109:                                 ; preds = %lor.lhs.false107
  %arraydecay110 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr111 = getelementptr inbounds i8* %arraydecay110, i64 1
  %call112 = call i32 @strcmp(i8* %add.ptr111, i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0))
  %tobool113 = icmp ne i32 %call112, 0
  br i1 %tobool113, label %if.then114, label %if.end115

if.then114:                                       ; preds = %lor.lhs.false109, %lor.lhs.false107, %if.end96
  call void @abort() noreturn nounwind
  unreachable

if.end115:                                        ; preds = %lor.lhs.false109
  %arraydecay116 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay116, i8 32, i64 64, i32 1, i1 false)
  %arraydecay117 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %38 = load i32* @x, align 4
  %inc118 = add nsw i32 %38, 1
  store i32 %inc118, i32* @x, align 4
  %and119 = and i32 %inc118, 1
  %idx.ext120 = sext i32 %and119 to i64
  %add.ptr121 = getelementptr inbounds i8* %arraydecay117, i64 %idx.ext120
  %39 = load i32* @y, align 4
  %inc122 = add nsw i32 %39, 1
  store i32 %inc122, i32* @y, align 4
  %and123 = and i32 %39, 3
  %idx.ext124 = sext i32 %and123 to i64
  %add.ptr125 = getelementptr inbounds i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i64 %idx.ext124
  %call126 = call i8* @strncpy(i8* %add.ptr121, i8* %add.ptr125, i64 10)
  %arraydecay127 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr128 = getelementptr inbounds i8* %arraydecay127, i64 1
  %cmp129 = icmp ne i8* %call126, %add.ptr128
  br i1 %cmp129, label %if.then138, label %lor.lhs.false130

lor.lhs.false130:                                 ; preds = %if.end115
  %40 = load i32* @x, align 4
  %cmp131 = icmp ne i32 %40, 7
  br i1 %cmp131, label %if.then138, label %lor.lhs.false132

lor.lhs.false132:                                 ; preds = %lor.lhs.false130
  %41 = load i32* @y, align 4
  %cmp133 = icmp ne i32 %41, 2
  br i1 %cmp133, label %if.then138, label %lor.lhs.false134

lor.lhs.false134:                                 ; preds = %lor.lhs.false132
  %arraydecay135 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %call136 = call i32 @memcmp(i8* %arraydecay135, i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0), i64 12)
  %tobool137 = icmp ne i32 %call136, 0
  br i1 %tobool137, label %if.then138, label %if.end139

if.then138:                                       ; preds = %lor.lhs.false134, %lor.lhs.false132, %lor.lhs.false130, %if.end115
  call void @abort() noreturn nounwind
  unreachable

if.end139:                                        ; preds = %lor.lhs.false134
  %arraydecay140 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay140, i8 32, i64 64, i32 1, i1 false)
  %arraydecay141 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %call142 = call i8* @strncpy(i8* %arraydecay141, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i64 8)
  %arraydecay143 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %cmp144 = icmp ne i8* %call142, %arraydecay143
  br i1 %cmp144, label %if.then149, label %lor.lhs.false145

lor.lhs.false145:                                 ; preds = %if.end139
  %arraydecay146 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %call147 = call i32 @memcmp(i8* %arraydecay146, i8* getelementptr inbounds ([10 x i8]* @.str8, i32 0, i32 0), i64 9)
  %tobool148 = icmp ne i32 %call147, 0
  br i1 %tobool148, label %if.then149, label %if.end150

if.then149:                                       ; preds = %lor.lhs.false145, %if.end139
  call void @abort() noreturn nounwind
  unreachable

if.end150:                                        ; preds = %lor.lhs.false145
  store i32 33, i32* @x, align 4
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8 32, i64 64, i32 1, i1 false)
  %42 = load i32* @x, align 4
  %inc151 = add nsw i32 %42, 1
  store i32 %inc151, i32* @x, align 4
  %43 = trunc i32 %42 to i8
  %44 = load i32* @y, align 4
  %inc152 = add nsw i32 %44, 1
  store i32 %inc152, i32* @y, align 4
  %conv = sext i32 %inc152 to i64
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8 %43, i64 %conv, i32 1, i1 false)
  br i1 false, label %if.then162, label %lor.lhs.false153

lor.lhs.false153:                                 ; preds = %if.end150
  %45 = load i32* @x, align 4
  %cmp154 = icmp ne i32 %45, 34
  br i1 %cmp154, label %if.then162, label %lor.lhs.false156

lor.lhs.false156:                                 ; preds = %lor.lhs.false153
  %46 = load i32* @y, align 4
  %cmp157 = icmp ne i32 %46, 3
  br i1 %cmp157, label %if.then162, label %lor.lhs.false159

lor.lhs.false159:                                 ; preds = %lor.lhs.false156
  %call160 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i64 3)
  %tobool161 = icmp ne i32 %call160, 0
  br i1 %tobool161, label %if.then162, label %if.end163

if.then162:                                       ; preds = %lor.lhs.false159, %lor.lhs.false156, %lor.lhs.false153, %if.end150
  call void @abort() noreturn nounwind
  unreachable

if.end163:                                        ; preds = %lor.lhs.false159
  %47 = load i32* @y, align 4
  %inc164 = add nsw i32 %47, 1
  store i32 %inc164, i32* @y, align 4
  %idx.ext165 = sext i32 %47 to i64
  %add.ptr166 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %idx.ext165
  call void @llvm.memset.p0i8.i64(i8* %add.ptr166, i8 45, i64 8, i32 1, i1 false)
  %cmp167 = icmp ne i8* %add.ptr166, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 3)
  br i1 %cmp167, label %if.then175, label %lor.lhs.false169

lor.lhs.false169:                                 ; preds = %if.end163
  %48 = load i32* @y, align 4
  %cmp170 = icmp ne i32 %48, 4
  br i1 %cmp170, label %if.then175, label %lor.lhs.false172

lor.lhs.false172:                                 ; preds = %lor.lhs.false169
  %call173 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0), i64 11)
  %tobool174 = icmp ne i32 %call173, 0
  br i1 %tobool174, label %if.then175, label %if.end176

if.then175:                                       ; preds = %lor.lhs.false172, %lor.lhs.false169, %if.end163
  call void @abort() noreturn nounwind
  unreachable

if.end176:                                        ; preds = %lor.lhs.false172
  store i32 10, i32* @x, align 4
  %49 = load i32* @x, align 4
  %inc177 = add nsw i32 %49, 1
  store i32 %inc177, i32* @x, align 4
  %idx.ext178 = sext i32 %inc177 to i64
  %add.ptr179 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %idx.ext178
  %50 = load i32* @y, align 4
  %inc180 = add nsw i32 %50, 1
  store i32 %inc180, i32* @y, align 4
  %conv181 = sext i32 %50 to i64
  call void @llvm.memset.p0i8.i64(i8* %add.ptr179, i8 0, i64 %conv181, i32 1, i1 false)
  %cmp182 = icmp ne i8* %add.ptr179, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 11)
  br i1 %cmp182, label %if.then193, label %lor.lhs.false184

lor.lhs.false184:                                 ; preds = %if.end176
  %51 = load i32* @x, align 4
  %cmp185 = icmp ne i32 %51, 11
  br i1 %cmp185, label %if.then193, label %lor.lhs.false187

lor.lhs.false187:                                 ; preds = %lor.lhs.false184
  %52 = load i32* @y, align 4
  %cmp188 = icmp ne i32 %52, 5
  br i1 %cmp188, label %if.then193, label %lor.lhs.false190

lor.lhs.false190:                                 ; preds = %lor.lhs.false187
  %call191 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 8), i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0), i64 7)
  %tobool192 = icmp ne i32 %call191, 0
  br i1 %tobool192, label %if.then193, label %if.end194

if.then193:                                       ; preds = %lor.lhs.false190, %lor.lhs.false187, %lor.lhs.false184, %if.end176
  call void @abort() noreturn nounwind
  unreachable

if.end194:                                        ; preds = %lor.lhs.false190
  %53 = load i32* @x, align 4
  %add = add nsw i32 %53, 4
  store i32 %add, i32* @x, align 4
  %idx.ext195 = sext i32 %add to i64
  %add.ptr196 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %idx.ext195
  call void @llvm.memset.p0i8.i64(i8* %add.ptr196, i8 0, i64 6, i32 1, i1 false)
  %cmp197 = icmp ne i8* %add.ptr196, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 15)
  br i1 %cmp197, label %if.then205, label %lor.lhs.false199

lor.lhs.false199:                                 ; preds = %if.end194
  %54 = load i32* @x, align 4
  %cmp200 = icmp ne i32 %54, 15
  br i1 %cmp200, label %if.then205, label %lor.lhs.false202

lor.lhs.false202:                                 ; preds = %lor.lhs.false199
  %call203 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 10), i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i64 11)
  %tobool204 = icmp ne i32 %call203, 0
  br i1 %tobool204, label %if.then205, label %if.end206

if.then205:                                       ; preds = %lor.lhs.false202, %lor.lhs.false199, %if.end194
  call void @abort() noreturn nounwind
  unreachable

if.end206:                                        ; preds = %lor.lhs.false202
  ret i32 0
}

declare i64 @strlen(i8*)

declare void @abort() noreturn nounwind

declare i32 @strcmp(i8*, i8*)

declare i8* @strchr(i8*, i32)

declare i8* @strrchr(i8*, i32)

declare i8* @strncpy(i8*, i8*, i64)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @memcmp(i8*, i8*, i64)
