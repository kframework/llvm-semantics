; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/string-opt-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %foo = alloca i8*, align 8
  %dst = alloca [64 x i8], align 16
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i8** %foo, align 8
  %tmp = load i8** @bar, align 8
  %call = call i64 @strlen(i8* %tmp)
  %cmp = icmp ne i64 %call, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load i8** @bar, align 8
  %tmp2 = load i32* @x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @x, align 4
  %and = and i32 %inc, 2
  %idx.ext = sext i32 %and to i64
  %add.ptr = getelementptr inbounds i8* %tmp1, i64 %idx.ext
  %call3 = call i64 @strlen(i8* %add.ptr)
  %cmp4 = icmp ne i64 %call3, 6
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %tmp7 = load i32* @x, align 4
  %cmp8 = icmp ne i32 %tmp7, 7
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %tmp11 = load i8** %foo, align 8
  %tmp12 = load i32* @x, align 4
  %inc13 = add nsw i32 %tmp12, 1
  store i32 %inc13, i32* @x, align 4
  %add.ptr14 = getelementptr inbounds i8* %tmp11, i64 6
  %call15 = call i64 @strlen(i8* %add.ptr14)
  %cmp16 = icmp ne i64 %call15, 5
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end10
  %tmp19 = load i32* @x, align 4
  %cmp20 = icmp ne i32 %tmp19, 8
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end18
  %tmp23 = load i8** %foo, align 8
  %tmp24 = load i32* @x, align 4
  %inc25 = add nsw i32 %tmp24, 1
  store i32 %inc25, i32* @x, align 4
  %and26 = and i32 %inc25, 1
  %idx.ext27 = sext i32 %and26 to i64
  %add.ptr28 = getelementptr inbounds i8* %tmp23, i64 %idx.ext27
  %call29 = call i64 @strlen(i8* %add.ptr28)
  %cmp30 = icmp ne i64 %call29, 10
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end22
  %tmp33 = load i32* @x, align 4
  %cmp34 = icmp ne i32 %tmp33, 9
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %tmp37 = load i8** %foo, align 8
  %tmp38 = load i32* @x, align 4
  %sub = sub nsw i32 %tmp38, 6
  store i32 %sub, i32* @x, align 4
  %idx.ext39 = sext i32 %sub to i64
  %add.ptr40 = getelementptr inbounds i8* %tmp37, i64 %idx.ext39
  %call41 = call i32 @strcmp(i8* %add.ptr40, i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  %tobool = icmp ne i32 %call41, 0
  br i1 %tobool, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.end36
  %tmp44 = load i32* @x, align 4
  %cmp45 = icmp ne i32 %tmp44, 3
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end43
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end43
  %tmp48 = load i8** %foo, align 8
  %tmp49 = load i8** @bar, align 8
  %call50 = call i32 @strcmp(i8* %tmp48, i8* %tmp49)
  %cmp51 = icmp sge i32 %call50, 0
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end47
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end47
  %tmp54 = load i8** %foo, align 8
  %tmp55 = load i8** @bar, align 8
  %tmp56 = load i32* @x, align 4
  %inc57 = add nsw i32 %tmp56, 1
  store i32 %inc57, i32* @x, align 4
  %and58 = and i32 %tmp56, 1
  %idx.ext59 = sext i32 %and58 to i64
  %add.ptr60 = getelementptr inbounds i8* %tmp55, i64 %idx.ext59
  %call61 = call i32 @strcmp(i8* %tmp54, i8* %add.ptr60)
  %cmp62 = icmp sge i32 %call61, 0
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end53
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end53
  %tmp65 = load i32* @x, align 4
  %cmp66 = icmp ne i32 %tmp65, 4
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %tmp69 = load i8** %foo, align 8
  %tmp70 = load i32* @x, align 4
  %inc71 = add nsw i32 %tmp70, 1
  store i32 %inc71, i32* @x, align 4
  %and72 = and i32 %tmp70, 7
  %idx.ext73 = sext i32 %and72 to i64
  %add.ptr74 = getelementptr inbounds i8* %tmp69, i64 %idx.ext73
  %call75 = call i8* @strchr(i8* %add.ptr74, i32 108)
  %tmp76 = load i8** %foo, align 8
  %add.ptr77 = getelementptr inbounds i8* %tmp76, i64 9
  %cmp78 = icmp ne i8* %call75, %add.ptr77
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end68
  %tmp81 = load i32* @x, align 4
  %cmp82 = icmp ne i32 %tmp81, 5
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %tmp85 = load i8** @bar, align 8
  %call86 = call i8* @strchr(i8* %tmp85, i32 111)
  %tmp87 = load i8** @bar, align 8
  %add.ptr88 = getelementptr inbounds i8* %tmp87, i64 4
  %cmp89 = icmp ne i8* %call86, %add.ptr88
  br i1 %cmp89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end91:                                         ; preds = %if.end84
  %tmp92 = load i8** @bar, align 8
  %call93 = call i8* @strchr(i8* %tmp92, i32 0)
  %tmp94 = load i8** @bar, align 8
  %add.ptr95 = getelementptr inbounds i8* %tmp94, i64 8
  %cmp96 = icmp ne i8* %call93, %add.ptr95
  br i1 %cmp96, label %if.then97, label %if.end98

if.then97:                                        ; preds = %if.end91
  call void @abort() noreturn nounwind
  unreachable

if.end98:                                         ; preds = %if.end91
  %tmp99 = load i8** @bar, align 8
  %call100 = call i8* @strrchr(i8* %tmp99, i32 120)
  %tobool101 = icmp ne i8* %call100, null
  br i1 %tobool101, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.end98
  call void @abort() noreturn nounwind
  unreachable

if.end103:                                        ; preds = %if.end98
  %tmp104 = load i8** @bar, align 8
  %call105 = call i8* @strrchr(i8* %tmp104, i32 111)
  %tmp106 = load i8** @bar, align 8
  %add.ptr107 = getelementptr inbounds i8* %tmp106, i64 4
  %cmp108 = icmp ne i8* %call105, %add.ptr107
  br i1 %cmp108, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.end103
  call void @abort() noreturn nounwind
  unreachable

if.end110:                                        ; preds = %if.end103
  %tmp111 = load i8** %foo, align 8
  %tmp112 = load i32* @x, align 4
  %inc113 = add nsw i32 %tmp112, 1
  store i32 %inc113, i32* @x, align 4
  %and114 = and i32 %tmp112, 1
  %idx.ext115 = sext i32 %and114 to i64
  %add.ptr116 = getelementptr inbounds i8* %tmp111, i64 %idx.ext115
  %tmp117 = load i32* @y, align 4
  %dec = add nsw i32 %tmp117, -1
  store i32 %dec, i32* @y, align 4
  %and118 = and i32 %dec, 1
  %idx.ext119 = sext i32 %and118 to i64
  %add.ptr120 = getelementptr inbounds i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i64 %idx.ext119
  %call121 = call i32 @strcmp(i8* %add.ptr116, i8* %add.ptr120)
  %tobool122 = icmp ne i32 %call121, 0
  br i1 %tobool122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end110
  call void @abort() noreturn nounwind
  unreachable

if.end124:                                        ; preds = %if.end110
  %tmp125 = load i32* @x, align 4
  %cmp126 = icmp ne i32 %tmp125, 6
  br i1 %cmp126, label %if.then129, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end124
  %tmp127 = load i32* @y, align 4
  %cmp128 = icmp ne i32 %tmp127, 0
  br i1 %cmp128, label %if.then129, label %if.end130

if.then129:                                       ; preds = %lor.lhs.false, %if.end124
  call void @abort() noreturn nounwind
  unreachable

if.end130:                                        ; preds = %lor.lhs.false
  %arrayidx = getelementptr inbounds [64 x i8]* %dst, i32 0, i64 5
  store i8 32, i8* %arrayidx, align 1
  %arrayidx131 = getelementptr inbounds [64 x i8]* %dst, i32 0, i64 6
  store i8 0, i8* %arrayidx131, align 1
  store i32 5, i32* @x, align 4
  store i32 1, i32* @y, align 4
  %arraydecay = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr132 = getelementptr inbounds i8* %arraydecay, i64 1
  %tmp133 = load i8** %foo, align 8
  %tmp134 = load i32* @x, align 4
  %inc135 = add nsw i32 %tmp134, 1
  store i32 %inc135, i32* @x, align 4
  %and136 = and i32 %tmp134, 3
  %idx.ext137 = sext i32 %and136 to i64
  %add.ptr138 = getelementptr inbounds i8* %tmp133, i64 %idx.ext137
  %call139 = call i8* @strncpy(i8* %add.ptr132, i8* %add.ptr138, i64 4)
  %arraydecay140 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr141 = getelementptr inbounds i8* %arraydecay140, i64 1
  %cmp142 = icmp ne i8* %call139, %add.ptr141
  br i1 %cmp142, label %if.then151, label %lor.lhs.false143

lor.lhs.false143:                                 ; preds = %if.end130
  %tmp144 = load i32* @x, align 4
  %cmp145 = icmp ne i32 %tmp144, 6
  br i1 %cmp145, label %if.then151, label %lor.lhs.false146

lor.lhs.false146:                                 ; preds = %lor.lhs.false143
  %arraydecay147 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr148 = getelementptr inbounds i8* %arraydecay147, i64 1
  %call149 = call i32 @strcmp(i8* %add.ptr148, i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0))
  %tobool150 = icmp ne i32 %call149, 0
  br i1 %tobool150, label %if.then151, label %if.end152

if.then151:                                       ; preds = %lor.lhs.false146, %lor.lhs.false143, %if.end130
  call void @abort() noreturn nounwind
  unreachable

if.end152:                                        ; preds = %lor.lhs.false146
  %arraydecay153 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay153, i8 32, i64 64, i32 1, i1 false)
  %arraydecay154 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %tmp155 = load i32* @x, align 4
  %inc156 = add nsw i32 %tmp155, 1
  store i32 %inc156, i32* @x, align 4
  %and157 = and i32 %inc156, 1
  %idx.ext158 = sext i32 %and157 to i64
  %add.ptr159 = getelementptr inbounds i8* %arraydecay154, i64 %idx.ext158
  %tmp160 = load i32* @y, align 4
  %inc161 = add nsw i32 %tmp160, 1
  store i32 %inc161, i32* @y, align 4
  %and162 = and i32 %tmp160, 3
  %idx.ext163 = sext i32 %and162 to i64
  %add.ptr164 = getelementptr inbounds i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i64 %idx.ext163
  %call165 = call i8* @strncpy(i8* %add.ptr159, i8* %add.ptr164, i64 10)
  %arraydecay166 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %add.ptr167 = getelementptr inbounds i8* %arraydecay166, i64 1
  %cmp168 = icmp ne i8* %call165, %add.ptr167
  br i1 %cmp168, label %if.then179, label %lor.lhs.false169

lor.lhs.false169:                                 ; preds = %if.end152
  %tmp170 = load i32* @x, align 4
  %cmp171 = icmp ne i32 %tmp170, 7
  br i1 %cmp171, label %if.then179, label %lor.lhs.false172

lor.lhs.false172:                                 ; preds = %lor.lhs.false169
  %tmp173 = load i32* @y, align 4
  %cmp174 = icmp ne i32 %tmp173, 2
  br i1 %cmp174, label %if.then179, label %lor.lhs.false175

lor.lhs.false175:                                 ; preds = %lor.lhs.false172
  %arraydecay176 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %call177 = call i32 @memcmp(i8* %arraydecay176, i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0), i64 12)
  %tobool178 = icmp ne i32 %call177, 0
  br i1 %tobool178, label %if.then179, label %if.end180

if.then179:                                       ; preds = %lor.lhs.false175, %lor.lhs.false172, %lor.lhs.false169, %if.end152
  call void @abort() noreturn nounwind
  unreachable

if.end180:                                        ; preds = %lor.lhs.false175
  %arraydecay181 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay181, i8 32, i64 64, i32 1, i1 false)
  %arraydecay182 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %call183 = call i8* @strncpy(i8* %arraydecay182, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i64 8)
  %arraydecay184 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %cmp185 = icmp ne i8* %call183, %arraydecay184
  br i1 %cmp185, label %if.then190, label %lor.lhs.false186

lor.lhs.false186:                                 ; preds = %if.end180
  %arraydecay187 = getelementptr inbounds [64 x i8]* %dst, i32 0, i32 0
  %call188 = call i32 @memcmp(i8* %arraydecay187, i8* getelementptr inbounds ([10 x i8]* @.str8, i32 0, i32 0), i64 9)
  %tobool189 = icmp ne i32 %call188, 0
  br i1 %tobool189, label %if.then190, label %if.end191

if.then190:                                       ; preds = %lor.lhs.false186, %if.end180
  call void @abort() noreturn nounwind
  unreachable

if.end191:                                        ; preds = %lor.lhs.false186
  store i32 33, i32* @x, align 4
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8 32, i64 64, i32 1, i1 false)
  %tmp192 = load i32* @x, align 4
  %inc193 = add nsw i32 %tmp192, 1
  store i32 %inc193, i32* @x, align 4
  %0 = trunc i32 %tmp192 to i8
  %tmp194 = load i32* @y, align 4
  %inc195 = add nsw i32 %tmp194, 1
  store i32 %inc195, i32* @y, align 4
  %conv = sext i32 %inc195 to i64
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8 %0, i64 %conv, i32 1, i1 false)
  br i1 false, label %if.then207, label %lor.lhs.false196

lor.lhs.false196:                                 ; preds = %if.end191
  %tmp197 = load i32* @x, align 4
  %cmp198 = icmp ne i32 %tmp197, 34
  br i1 %cmp198, label %if.then207, label %lor.lhs.false200

lor.lhs.false200:                                 ; preds = %lor.lhs.false196
  %tmp201 = load i32* @y, align 4
  %cmp202 = icmp ne i32 %tmp201, 3
  br i1 %cmp202, label %if.then207, label %lor.lhs.false204

lor.lhs.false204:                                 ; preds = %lor.lhs.false200
  %call205 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i64 3)
  %tobool206 = icmp ne i32 %call205, 0
  br i1 %tobool206, label %if.then207, label %if.end208

if.then207:                                       ; preds = %lor.lhs.false204, %lor.lhs.false200, %lor.lhs.false196, %if.end191
  call void @abort() noreturn nounwind
  unreachable

if.end208:                                        ; preds = %lor.lhs.false204
  %tmp209 = load i32* @y, align 4
  %inc210 = add nsw i32 %tmp209, 1
  store i32 %inc210, i32* @y, align 4
  %idx.ext211 = sext i32 %tmp209 to i64
  %add.ptr212 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %idx.ext211
  call void @llvm.memset.p0i8.i64(i8* %add.ptr212, i8 45, i64 8, i32 1, i1 false)
  %cmp213 = icmp ne i8* %add.ptr212, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 3)
  br i1 %cmp213, label %if.then222, label %lor.lhs.false215

lor.lhs.false215:                                 ; preds = %if.end208
  %tmp216 = load i32* @y, align 4
  %cmp217 = icmp ne i32 %tmp216, 4
  br i1 %cmp217, label %if.then222, label %lor.lhs.false219

lor.lhs.false219:                                 ; preds = %lor.lhs.false215
  %call220 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0), i64 11)
  %tobool221 = icmp ne i32 %call220, 0
  br i1 %tobool221, label %if.then222, label %if.end223

if.then222:                                       ; preds = %lor.lhs.false219, %lor.lhs.false215, %if.end208
  call void @abort() noreturn nounwind
  unreachable

if.end223:                                        ; preds = %lor.lhs.false219
  store i32 10, i32* @x, align 4
  %tmp224 = load i32* @x, align 4
  %inc225 = add nsw i32 %tmp224, 1
  store i32 %inc225, i32* @x, align 4
  %idx.ext226 = sext i32 %inc225 to i64
  %add.ptr227 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %idx.ext226
  %tmp228 = load i32* @y, align 4
  %inc229 = add nsw i32 %tmp228, 1
  store i32 %inc229, i32* @y, align 4
  %conv230 = sext i32 %tmp228 to i64
  call void @llvm.memset.p0i8.i64(i8* %add.ptr227, i8 0, i64 %conv230, i32 1, i1 false)
  %cmp231 = icmp ne i8* %add.ptr227, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 11)
  br i1 %cmp231, label %if.then244, label %lor.lhs.false233

lor.lhs.false233:                                 ; preds = %if.end223
  %tmp234 = load i32* @x, align 4
  %cmp235 = icmp ne i32 %tmp234, 11
  br i1 %cmp235, label %if.then244, label %lor.lhs.false237

lor.lhs.false237:                                 ; preds = %lor.lhs.false233
  %tmp238 = load i32* @y, align 4
  %cmp239 = icmp ne i32 %tmp238, 5
  br i1 %cmp239, label %if.then244, label %lor.lhs.false241

lor.lhs.false241:                                 ; preds = %lor.lhs.false237
  %call242 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 8), i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0), i64 7)
  %tobool243 = icmp ne i32 %call242, 0
  br i1 %tobool243, label %if.then244, label %if.end245

if.then244:                                       ; preds = %lor.lhs.false241, %lor.lhs.false237, %lor.lhs.false233, %if.end223
  call void @abort() noreturn nounwind
  unreachable

if.end245:                                        ; preds = %lor.lhs.false241
  %tmp246 = load i32* @x, align 4
  %add = add nsw i32 %tmp246, 4
  store i32 %add, i32* @x, align 4
  %idx.ext247 = sext i32 %add to i64
  %add.ptr248 = getelementptr inbounds i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i32 0), i64 %idx.ext247
  call void @llvm.memset.p0i8.i64(i8* %add.ptr248, i8 0, i64 6, i32 1, i1 false)
  %cmp249 = icmp ne i8* %add.ptr248, getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 15)
  br i1 %cmp249, label %if.then258, label %lor.lhs.false251

lor.lhs.false251:                                 ; preds = %if.end245
  %tmp252 = load i32* @x, align 4
  %cmp253 = icmp ne i32 %tmp252, 15
  br i1 %cmp253, label %if.then258, label %lor.lhs.false255

lor.lhs.false255:                                 ; preds = %lor.lhs.false251
  %call256 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i32 0, i64 10), i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i64 11)
  %tobool257 = icmp ne i32 %call256, 0
  br i1 %tobool257, label %if.then258, label %if.end259

if.then258:                                       ; preds = %lor.lhs.false255, %lor.lhs.false251, %if.end245
  call void @abort() noreturn nounwind
  unreachable

if.end259:                                        ; preds = %lor.lhs.false255
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
