; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/string-opt-5.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global i32 6, align 4
@y = global i32 1, align 4
@.str = private unnamed_addr constant [9 x i8] c"hi world\00", align 1
@bar = global i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), align 8
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

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  %dst = alloca [64 x i8], align 16
  %tmp = load i8** @bar, align 8
  %call = call i64 @strlen(i8* %tmp) nounwind
  %cmp = icmp eq i64 %call, 8
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i32* @x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @x, align 4
  %and = and i32 %inc, 2
  %idx.ext1 = zext i32 %and to i64
  %add.ptr = getelementptr inbounds i8* %tmp, i64 %idx.ext1
  %call3 = call i64 @strlen(i8* %add.ptr) nounwind
  %cmp4 = icmp eq i64 %call3, 6
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %cmp8 = icmp eq i32 %inc, 7
  br i1 %cmp8, label %if.end22, label %if.then9

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end6
  %inc25 = add i32 %tmp2, 3
  store i32 %inc25, i32* @x, align 4
  %and26 = and i32 %inc25, 1
  %idx.ext272 = zext i32 %and26 to i64
  %add.ptr28 = getelementptr inbounds [12 x i8]* @.str1, i64 0, i64 %idx.ext272
  %call29 = call i64 @strlen(i8* %add.ptr28) nounwind
  %cmp30 = icmp eq i64 %call29, 10
  br i1 %cmp30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end22
  %cmp34 = icmp eq i32 %inc25, 9
  br i1 %cmp34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %sub = add i32 %tmp2, -3
  store i32 %sub, i32* @x, align 4
  %idx.ext39 = sext i32 %sub to i64
  %add.ptr40 = getelementptr inbounds [12 x i8]* @.str1, i64 0, i64 %idx.ext39
  %call41 = call i32 @strcmp(i8* %add.ptr40, i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0)) nounwind
  %tobool = icmp eq i32 %call41, 0
  br i1 %tobool, label %if.end43, label %if.then42

if.then42:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.end36
  %cmp45 = icmp eq i32 %sub, 3
  br i1 %cmp45, label %if.end47, label %if.then46

if.then46:                                        ; preds = %if.end43
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end43
  %call50 = call i32 @strcmp(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i8* %tmp) nounwind
  %cmp51 = icmp sgt i32 %call50, -1
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end47
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end47
  %inc57 = add i32 %tmp2, -2
  store i32 %inc57, i32* @x, align 4
  %and58 = and i32 %sub, 1
  %idx.ext593 = zext i32 %and58 to i64
  %add.ptr60 = getelementptr inbounds i8* %tmp, i64 %idx.ext593
  %call61 = call i32 @strcmp(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i8* %add.ptr60) nounwind
  %cmp62 = icmp sgt i32 %call61, -1
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end53
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end53
  %cmp66 = icmp eq i32 %inc57, 4
  br i1 %cmp66, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %inc71 = add i32 %tmp2, -1
  store i32 %inc71, i32* @x, align 4
  %and72 = and i32 %inc57, 7
  %idx.ext734 = zext i32 %and72 to i64
  %add.ptr74 = getelementptr inbounds [12 x i8]* @.str1, i64 0, i64 %idx.ext734
  %call75 = call i8* @strchr(i8* %add.ptr74, i32 108) nounwind
  %cmp78 = icmp eq i8* %call75, getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 9)
  br i1 %cmp78, label %if.end80, label %if.then79

if.then79:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end68
  %cmp82 = icmp eq i32 %inc71, 5
  br i1 %cmp82, label %if.end84, label %if.then83

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %call86 = call i8* @strchr(i8* %tmp, i32 111) nounwind
  %add.ptr88 = getelementptr inbounds i8* %tmp, i64 4
  %cmp89 = icmp eq i8* %call86, %add.ptr88
  br i1 %cmp89, label %if.end91, label %if.then90

if.then90:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end91:                                         ; preds = %if.end84
  %call93 = call i8* @strchr(i8* %tmp, i32 0) nounwind
  %add.ptr95 = getelementptr inbounds i8* %tmp, i64 8
  %cmp96 = icmp eq i8* %call93, %add.ptr95
  br i1 %cmp96, label %if.end98, label %if.then97

if.then97:                                        ; preds = %if.end91
  call void @abort() noreturn nounwind
  unreachable

if.end98:                                         ; preds = %if.end91
  %call100 = call i8* @strrchr(i8* %tmp, i32 120) nounwind
  %tobool101 = icmp eq i8* %call100, null
  br i1 %tobool101, label %if.end103, label %if.then102

if.then102:                                       ; preds = %if.end98
  call void @abort() noreturn nounwind
  unreachable

if.end103:                                        ; preds = %if.end98
  %call105 = call i8* @strrchr(i8* %tmp, i32 111) nounwind
  %cmp108 = icmp eq i8* %call105, %add.ptr88
  br i1 %cmp108, label %if.end110, label %if.then109

if.then109:                                       ; preds = %if.end103
  call void @abort() noreturn nounwind
  unreachable

if.end110:                                        ; preds = %if.end103
  store i32 %tmp2, i32* @x, align 4
  %and114 = and i32 %inc71, 1
  %idx.ext1155 = zext i32 %and114 to i64
  %add.ptr116 = getelementptr inbounds [12 x i8]* @.str1, i64 0, i64 %idx.ext1155
  %tmp117 = load i32* @y, align 4
  %dec = add nsw i32 %tmp117, -1
  store i32 %dec, i32* @y, align 4
  %and118 = and i32 %dec, 1
  %idx.ext1196 = zext i32 %and118 to i64
  %add.ptr120 = getelementptr inbounds [11 x i8]* @.str3, i64 0, i64 %idx.ext1196
  %call121 = call i32 @strcmp(i8* %add.ptr116, i8* %add.ptr120) nounwind
  %tobool122 = icmp eq i32 %call121, 0
  br i1 %tobool122, label %if.end124, label %if.then123

if.then123:                                       ; preds = %if.end110
  call void @abort() noreturn nounwind
  unreachable

if.end124:                                        ; preds = %if.end110
  %cmp126 = icmp eq i32 %tmp2, 6
  %cmp128 = icmp eq i32 %dec, 0
  %or.cond = and i1 %cmp126, %cmp128
  br i1 %or.cond, label %lor.lhs.false146, label %if.then129

if.then129:                                       ; preds = %if.end124
  call void @abort() noreturn nounwind
  unreachable

lor.lhs.false146:                                 ; preds = %if.end124
  %arrayidx = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 5
  store i8 32, i8* %arrayidx, align 1
  %arrayidx131 = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 6
  store i8 0, i8* %arrayidx131, align 2
  store i32 1, i32* @y, align 4
  %add.ptr132 = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 1
  store i32 6, i32* @x, align 4
  %0 = bitcast i8* %add.ptr132 to i32*
  store i32 1869376613, i32* %0, align 1
  %call149 = call i32 @strcmp(i8* %add.ptr132, i8* getelementptr inbounds ([6 x i8]* @.str4, i64 0, i64 0)) nounwind
  %tobool150 = icmp eq i32 %call149, 0
  br i1 %tobool150, label %if.end152, label %if.then151

if.then151:                                       ; preds = %lor.lhs.false146
  call void @abort() noreturn nounwind
  unreachable

if.end152:                                        ; preds = %lor.lhs.false146
  %arraydecay153 = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay153, i8 32, i64 64, i32 16, i1 false)
  store i32 7, i32* @x, align 4
  store i32 2, i32* @y, align 4
  %call165 = call i8* @strncpy(i8* %add.ptr132, i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 1), i64 10) nounwind
  %cmp168 = icmp eq i8* %call165, %add.ptr132
  %tmp170 = load i32* @x, align 4
  %cmp171 = icmp eq i32 %tmp170, 7
  %or.cond10 = and i1 %cmp168, %cmp171
  %tmp173 = load i32* @y, align 4
  %cmp174 = icmp eq i32 %tmp173, 2
  %or.cond11 = and i1 %or.cond10, %cmp174
  br i1 %or.cond11, label %lor.lhs.false175, label %if.then179

lor.lhs.false175:                                 ; preds = %if.end152
  %call177 = call i32 @memcmp(i8* %arraydecay153, i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i64 12) nounwind
  %tobool178 = icmp eq i32 %call177, 0
  br i1 %tobool178, label %if.end180, label %if.then179

if.then179:                                       ; preds = %lor.lhs.false175, %if.end152
  call void @abort() noreturn nounwind
  unreachable

if.end180:                                        ; preds = %lor.lhs.false175
  call void @llvm.memset.p0i8.i64(i8* %arraydecay153, i8 32, i64 64, i32 16, i1 false)
  %call183 = call i8* @strncpy(i8* %arraydecay153, i8* getelementptr inbounds ([6 x i8]* @.str7, i64 0, i64 0), i64 8) nounwind
  %cmp185 = icmp eq i8* %call183, %arraydecay153
  br i1 %cmp185, label %lor.lhs.false186, label %if.then190

lor.lhs.false186:                                 ; preds = %if.end180
  %call188 = call i32 @memcmp(i8* %arraydecay153, i8* getelementptr inbounds ([10 x i8]* @.str8, i64 0, i64 0), i64 9) nounwind
  %tobool189 = icmp eq i32 %call188, 0
  br i1 %tobool189, label %if.end191, label %if.then190

if.then190:                                       ; preds = %lor.lhs.false186, %if.end180
  call void @abort() noreturn nounwind
  unreachable

if.end191:                                        ; preds = %lor.lhs.false186
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8 32, i64 64, i32 16, i1 false)
  store i32 34, i32* @x, align 4
  %tmp194 = load i32* @y, align 4
  %inc195 = add nsw i32 %tmp194, 1
  store i32 %inc195, i32* @y, align 4
  %conv = sext i32 %inc195 to i64
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8 33, i64 %conv, i32 16, i1 false)
  %cmp202 = icmp eq i32 %inc195, 3
  br i1 %cmp202, label %lor.lhs.false204, label %if.then207

lor.lhs.false204:                                 ; preds = %if.end191
  %call205 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i64 3) nounwind
  %tobool206 = icmp eq i32 %call205, 0
  br i1 %tobool206, label %if.end208, label %if.then207

if.then207:                                       ; preds = %lor.lhs.false204, %if.end191
  call void @abort() noreturn nounwind
  unreachable

if.end208:                                        ; preds = %lor.lhs.false204
  %inc210 = add i32 %tmp194, 2
  store i32 %inc210, i32* @y, align 4
  %add.ptr212 = getelementptr inbounds [64 x i8]* @buf, i64 0, i64 %conv
  %1 = bitcast i8* %add.ptr212 to i64*
  store i64 3255307777713450285, i64* %1, align 1
  %cmp217 = icmp eq i32 %inc210, 4
  %or.cond13 = and i1 %cmp202, %cmp217
  br i1 %or.cond13, label %lor.lhs.false219, label %if.then222

lor.lhs.false219:                                 ; preds = %if.end208
  %call220 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8]* @.str10, i64 0, i64 0), i64 11) nounwind
  %tobool221 = icmp eq i32 %call220, 0
  br i1 %tobool221, label %if.end223, label %if.then222

if.then222:                                       ; preds = %lor.lhs.false219, %if.end208
  call void @abort() noreturn nounwind
  unreachable

if.end223:                                        ; preds = %lor.lhs.false219
  store i32 11, i32* @x, align 4
  %inc229 = add i32 %tmp194, 3
  store i32 %inc229, i32* @y, align 4
  %conv230 = sext i32 %inc210 to i64
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 11), i8 0, i64 %conv230, i32 1, i1 false)
  %cmp239 = icmp eq i32 %inc229, 5
  br i1 %cmp239, label %lor.lhs.false241, label %if.then244

lor.lhs.false241:                                 ; preds = %if.end223
  %call242 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 8), i8* getelementptr inbounds ([7 x i8]* @.str11, i64 0, i64 0), i64 7) nounwind
  %tobool243 = icmp eq i32 %call242, 0
  br i1 %tobool243, label %lor.lhs.false255, label %if.then244

if.then244:                                       ; preds = %lor.lhs.false241, %if.end223
  call void @abort() noreturn nounwind
  unreachable

lor.lhs.false255:                                 ; preds = %lor.lhs.false241
  store i32 15, i32* @x, align 4
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 15), i8 0, i64 6, i32 1, i1 false)
  %call256 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 10), i8* getelementptr inbounds ([11 x i8]* @.str12, i64 0, i64 0), i64 11) nounwind
  %tobool257 = icmp eq i32 %call256, 0
  br i1 %tobool257, label %if.end259, label %if.then258

if.then258:                                       ; preds = %lor.lhs.false255
  call void @abort() noreturn nounwind
  unreachable

if.end259:                                        ; preds = %lor.lhs.false255
  ret i32 0
}

declare i64 @strlen(i8* nocapture) nounwind readonly

declare void @abort() noreturn nounwind

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare i8* @strchr(i8*, i32) nounwind readonly

declare i8* @strrchr(i8*, i32) nounwind readonly

declare i8* @strncpy(i8*, i8* nocapture, i64) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) nounwind readonly
