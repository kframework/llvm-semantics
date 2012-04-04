; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/string-opt-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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

define i32 @main() nounwind uwtable {
entry:
  %dst = alloca [64 x i8], align 16
  %0 = load i8** @bar, align 8, !tbaa !0
  %call = call i64 @strlen(i8* %0) nounwind
  %cmp = icmp eq i64 %call, 8
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32* @x, align 4, !tbaa !3
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @x, align 4, !tbaa !3
  %and = and i32 %inc, 2
  %idx.ext215 = zext i32 %and to i64
  %add.ptr = getelementptr inbounds i8* %0, i64 %idx.ext215
  %call1 = call i64 @strlen(i8* %add.ptr) nounwind
  %cmp2 = icmp eq i64 %call1, 6
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %cmp5 = icmp eq i32 %inc, 7
  br i1 %cmp5, label %if.end16, label %if.then6

if.then6:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end4
  %inc17 = add nsw i32 %1, 3
  store i32 %inc17, i32* @x, align 4, !tbaa !3
  %and18 = and i32 %inc17, 1
  %idx.ext19216 = zext i32 %and18 to i64
  %add.ptr20 = getelementptr inbounds [12 x i8]* @.str1, i64 0, i64 %idx.ext19216
  %call21 = call i64 @strlen(i8* %add.ptr20) nounwind
  %cmp22 = icmp eq i64 %call21, 10
  br i1 %cmp22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end16
  %cmp25 = icmp eq i32 %inc17, 9
  br i1 %cmp25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end24
  %sub = add nsw i32 %1, -3
  store i32 %sub, i32* @x, align 4, !tbaa !3
  %idx.ext28 = sext i32 %sub to i64
  %add.ptr29 = getelementptr inbounds [12 x i8]* @.str1, i64 0, i64 %idx.ext28
  %call30 = call i32 @strcmp(i8* %add.ptr29, i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0)) nounwind
  %tobool = icmp eq i32 %call30, 0
  br i1 %tobool, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end27
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end27
  %cmp33 = icmp eq i32 %sub, 3
  br i1 %cmp33, label %if.end35, label %if.then34

if.then34:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %if.end32
  %call36 = call i32 @strcmp(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i8* %0) nounwind
  %cmp37 = icmp sgt i32 %call36, -1
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.end35
  %inc40 = add nsw i32 %1, -2
  store i32 %inc40, i32* @x, align 4, !tbaa !3
  %add.ptr43 = getelementptr inbounds i8* %0, i64 1
  %call44 = call i32 @strcmp(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i8* %add.ptr43) nounwind
  %cmp45 = icmp sgt i32 %call44, -1
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end39
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end39
  %cmp48 = icmp eq i32 %inc40, 4
  br i1 %cmp48, label %if.end50, label %if.then49

if.then49:                                        ; preds = %if.end47
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.end47
  %inc51 = add nsw i32 %1, -1
  store i32 %inc51, i32* @x, align 4, !tbaa !3
  %call55 = call i8* @strchr(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 4), i32 108) nounwind
  %cmp57 = icmp eq i8* %call55, getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 9)
  br i1 %cmp57, label %if.end59, label %if.then58

if.then58:                                        ; preds = %if.end50
  call void @abort() noreturn nounwind
  unreachable

if.end59:                                         ; preds = %if.end50
  %cmp60 = icmp eq i32 %inc51, 5
  br i1 %cmp60, label %if.end62, label %if.then61

if.then61:                                        ; preds = %if.end59
  call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %if.end59
  %call63 = call i8* @strchr(i8* %0, i32 111) nounwind
  %add.ptr64 = getelementptr inbounds i8* %0, i64 4
  %cmp65 = icmp eq i8* %call63, %add.ptr64
  br i1 %cmp65, label %if.end67, label %if.then66

if.then66:                                        ; preds = %if.end62
  call void @abort() noreturn nounwind
  unreachable

if.end67:                                         ; preds = %if.end62
  %call68 = call i8* @strchr(i8* %0, i32 0) nounwind
  %add.ptr69 = getelementptr inbounds i8* %0, i64 8
  %cmp70 = icmp eq i8* %call68, %add.ptr69
  br i1 %cmp70, label %if.end72, label %if.then71

if.then71:                                        ; preds = %if.end67
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end67
  %call73 = call i8* @strrchr(i8* %0, i32 120) nounwind
  %tobool74 = icmp eq i8* %call73, null
  br i1 %tobool74, label %if.end76, label %if.then75

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %call77 = call i8* @strrchr(i8* %0, i32 111) nounwind
  %cmp79 = icmp eq i8* %call77, %call63
  br i1 %cmp79, label %if.end81, label %if.then80

if.then80:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end81:                                         ; preds = %if.end76
  store i32 %1, i32* @x, align 4, !tbaa !3
  %2 = load i32* @y, align 4, !tbaa !3
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* @y, align 4, !tbaa !3
  %and86 = and i32 %dec, 1
  %idx.ext87220 = zext i32 %and86 to i64
  %add.ptr88 = getelementptr inbounds [11 x i8]* @.str3, i64 0, i64 %idx.ext87220
  %call89 = call i32 @strcmp(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 1), i8* %add.ptr88) nounwind
  %tobool90 = icmp eq i32 %call89, 0
  br i1 %tobool90, label %if.end92, label %if.then91

if.then91:                                        ; preds = %if.end81
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end81
  %cmp93 = icmp ne i32 %1, 6
  %cmp94 = icmp ne i32 %dec, 0
  %or.cond = or i1 %cmp93, %cmp94
  br i1 %or.cond, label %if.then95, label %lor.lhs.false109

if.then95:                                        ; preds = %if.end92
  call void @abort() noreturn nounwind
  unreachable

lor.lhs.false109:                                 ; preds = %if.end92
  %arrayidx = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 5
  store i8 32, i8* %arrayidx, align 1, !tbaa !1
  %arrayidx97 = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 6
  store i8 0, i8* %arrayidx97, align 2, !tbaa !1
  store i32 1, i32* @y, align 4, !tbaa !3
  %arraydecay = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 0
  %add.ptr98 = getelementptr inbounds [64 x i8]* %dst, i64 0, i64 1
  store i32 6, i32* @x, align 4, !tbaa !3
  %3 = bitcast i8* %add.ptr98 to i32*
  store i32 1869376613, i32* %3, align 1
  %call112 = call i32 @strcmp(i8* %add.ptr98, i8* getelementptr inbounds ([6 x i8]* @.str4, i64 0, i64 0)) nounwind
  %tobool113 = icmp eq i32 %call112, 0
  br i1 %tobool113, label %if.end115, label %if.then114

if.then114:                                       ; preds = %lor.lhs.false109
  call void @abort() noreturn nounwind
  unreachable

if.end115:                                        ; preds = %lor.lhs.false109
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 32, i64 64, i32 16, i1 false)
  store i32 7, i32* @x, align 4, !tbaa !3
  store i32 2, i32* @y, align 4, !tbaa !3
  %call126 = call i8* @strncpy(i8* %add.ptr98, i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 1), i64 10) nounwind
  %cmp129 = icmp ne i8* %call126, %add.ptr98
  %4 = load i32* @x, align 4, !tbaa !3
  %cmp131 = icmp ne i32 %4, 7
  %or.cond208 = or i1 %cmp129, %cmp131
  %5 = load i32* @y, align 4, !tbaa !3
  %cmp133 = icmp ne i32 %5, 2
  %or.cond209 = or i1 %or.cond208, %cmp133
  br i1 %or.cond209, label %if.then138, label %lor.lhs.false134

lor.lhs.false134:                                 ; preds = %if.end115
  %call136 = call i32 @memcmp(i8* %arraydecay, i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i64 12) nounwind
  %tobool137 = icmp eq i32 %call136, 0
  br i1 %tobool137, label %if.end139, label %if.then138

if.then138:                                       ; preds = %lor.lhs.false134, %if.end115
  call void @abort() noreturn nounwind
  unreachable

if.end139:                                        ; preds = %lor.lhs.false134
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 32, i64 64, i32 16, i1 false)
  %call142 = call i8* @strncpy(i8* %arraydecay, i8* getelementptr inbounds ([6 x i8]* @.str7, i64 0, i64 0), i64 8) nounwind
  %cmp144 = icmp eq i8* %call142, %arraydecay
  br i1 %cmp144, label %lor.lhs.false145, label %if.then149

lor.lhs.false145:                                 ; preds = %if.end139
  %call147 = call i32 @memcmp(i8* %arraydecay, i8* getelementptr inbounds ([10 x i8]* @.str8, i64 0, i64 0), i64 9) nounwind
  %tobool148 = icmp eq i32 %call147, 0
  br i1 %tobool148, label %if.end150, label %if.then149

if.then149:                                       ; preds = %lor.lhs.false145, %if.end139
  call void @abort() noreturn nounwind
  unreachable

if.end150:                                        ; preds = %lor.lhs.false145
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8 32, i64 64, i32 16, i1 false)
  store i32 34, i32* @x, align 4, !tbaa !3
  %6 = load i32* @y, align 4, !tbaa !3
  %inc152 = add nsw i32 %6, 1
  store i32 %inc152, i32* @y, align 4, !tbaa !3
  %conv = sext i32 %inc152 to i64
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8 33, i64 %conv, i32 16, i1 false)
  %cmp157 = icmp eq i32 %inc152, 3
  br i1 %cmp157, label %lor.lhs.false159, label %if.then162

lor.lhs.false159:                                 ; preds = %if.end150
  %call160 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i64 3) nounwind
  %tobool161 = icmp eq i32 %call160, 0
  br i1 %tobool161, label %lor.lhs.false172, label %if.then162

if.then162:                                       ; preds = %if.end150, %lor.lhs.false159
  call void @abort() noreturn nounwind
  unreachable

lor.lhs.false172:                                 ; preds = %lor.lhs.false159
  store i32 4, i32* @y, align 4, !tbaa !3
  store i64 3255307777713450285, i64* bitcast (i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 3) to i64*), align 1
  %call173 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8]* @.str10, i64 0, i64 0), i64 11) nounwind
  %tobool174 = icmp eq i32 %call173, 0
  br i1 %tobool174, label %lor.lhs.false190, label %if.then175

if.then175:                                       ; preds = %lor.lhs.false172
  call void @abort() noreturn nounwind
  unreachable

lor.lhs.false190:                                 ; preds = %lor.lhs.false172
  store i32 11, i32* @x, align 4, !tbaa !3
  store i32 5, i32* @y, align 4, !tbaa !3
  store i32 0, i32* bitcast (i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 11) to i32*), align 1
  %call191 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 8), i8* getelementptr inbounds ([7 x i8]* @.str11, i64 0, i64 0), i64 7) nounwind
  %tobool192 = icmp eq i32 %call191, 0
  br i1 %tobool192, label %lor.lhs.false202, label %if.then193

if.then193:                                       ; preds = %lor.lhs.false190
  call void @abort() noreturn nounwind
  unreachable

lor.lhs.false202:                                 ; preds = %lor.lhs.false190
  store i32 15, i32* @x, align 4, !tbaa !3
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 15), i8 0, i64 6, i32 1, i1 false)
  %call203 = call i32 @memcmp(i8* getelementptr inbounds ([64 x i8]* @buf, i64 0, i64 10), i8* getelementptr inbounds ([11 x i8]* @.str12, i64 0, i64 0), i64 11) nounwind
  %tobool204 = icmp eq i32 %call203, 0
  br i1 %tobool204, label %if.end206, label %if.then205

if.then205:                                       ; preds = %lor.lhs.false202
  call void @abort() noreturn nounwind
  unreachable

if.end206:                                        ; preds = %lor.lhs.false202
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

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
