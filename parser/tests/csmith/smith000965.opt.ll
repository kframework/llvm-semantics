; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000965.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -1145, align 2
@g_4 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca [7 x i16], align 2
  %arrayidx = getelementptr [7 x i16]* %l_7, i64 0, i64 0
  store i16 29887, i16* %arrayidx, align 2
  %arrayidx.1 = getelementptr [7 x i16]* %l_7, i64 0, i64 1
  store i16 29887, i16* %arrayidx.1, align 2
  %arrayidx.2 = getelementptr [7 x i16]* %l_7, i64 0, i64 2
  store i16 29887, i16* %arrayidx.2, align 2
  %arrayidx.3 = getelementptr [7 x i16]* %l_7, i64 0, i64 3
  store i16 29887, i16* %arrayidx.3, align 2
  %arrayidx.4 = getelementptr [7 x i16]* %l_7, i64 0, i64 4
  store i16 29887, i16* %arrayidx.4, align 2
  %arrayidx.5 = getelementptr [7 x i16]* %l_7, i64 0, i64 5
  store i16 29887, i16* %arrayidx.5, align 2
  %arrayidx.6 = getelementptr [7 x i16]* %l_7, i64 0, i64 6
  store i16 29887, i16* %arrayidx.6, align 2
  %tmp3 = load i16* @g_2, align 2
  %conv = zext i16 %tmp3 to i32
  %g_4.promoted = load i32* @g_4, align 4
  br label %lbl_8

lbl_8:                                            ; preds = %entry, %if.else
  %tmp55 = phi i32 [ %g_4.promoted, %entry ], [ %xor, %if.else ]
  %xor = xor i32 %tmp55, %conv
  %conv8 = trunc i32 %xor to i16
  %tobool = icmp eq i16 %conv8, 0
  br i1 %tobool, label %if.else, label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %lbl_8
  store i32 %xor, i32* @g_4, align 4
  store i16 -21216, i16* %arrayidx, align 2
  store i16 -21216, i16* %arrayidx.1, align 2
  store i16 -21216, i16* %arrayidx.2, align 2
  store i16 -21216, i16* %arrayidx.3, align 2
  store i16 -21216, i16* %arrayidx.4, align 2
  store i16 -21216, i16* %arrayidx.5, align 2
  store i16 -21216, i16* %arrayidx.6, align 2
  store i16 7, i16* @g_2, align 2
  br label %if.end26

if.else:                                          ; preds = %lbl_8
  %tobool24 = icmp eq i32 %tmp55, %conv
  br i1 %tobool24, label %if.end26.loopexit4, label %lbl_8

if.end26.loopexit4:                               ; preds = %if.else
  store i32 %xor, i32* @g_4, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.end26.loopexit4, %for.cond9.preheader
  ret i16 %conv8
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_7.i = alloca [7 x i16], align 2
  %0 = bitcast [7 x i16]* %l_7.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx.i = getelementptr [7 x i16]* %l_7.i, i64 0, i64 0
  store i16 29887, i16* %arrayidx.i, align 2
  %arrayidx.1.i = getelementptr [7 x i16]* %l_7.i, i64 0, i64 1
  store i16 29887, i16* %arrayidx.1.i, align 2
  %arrayidx.2.i = getelementptr [7 x i16]* %l_7.i, i64 0, i64 2
  store i16 29887, i16* %arrayidx.2.i, align 2
  %arrayidx.3.i = getelementptr [7 x i16]* %l_7.i, i64 0, i64 3
  store i16 29887, i16* %arrayidx.3.i, align 2
  %arrayidx.4.i = getelementptr [7 x i16]* %l_7.i, i64 0, i64 4
  store i16 29887, i16* %arrayidx.4.i, align 2
  %arrayidx.5.i = getelementptr [7 x i16]* %l_7.i, i64 0, i64 5
  store i16 29887, i16* %arrayidx.5.i, align 2
  %arrayidx.6.i = getelementptr [7 x i16]* %l_7.i, i64 0, i64 6
  store i16 29887, i16* %arrayidx.6.i, align 2
  %tmp3.i = load i16* @g_2, align 2
  %conv.i = zext i16 %tmp3.i to i32
  %g_4.promoted.i = load i32* @g_4, align 4
  br label %lbl_8.i

lbl_8.i:                                          ; preds = %if.else.i, %entry
  %tmp55.i = phi i32 [ %g_4.promoted.i, %entry ], [ %xor.i, %if.else.i ]
  %xor.i = xor i32 %tmp55.i, %conv.i
  %conv8.i = trunc i32 %xor.i to i16
  %tobool.i = icmp eq i16 %conv8.i, 0
  br i1 %tobool.i, label %if.else.i, label %for.cond9.preheader.i

for.cond9.preheader.i:                            ; preds = %lbl_8.i
  store i32 %xor.i, i32* @g_4, align 4
  store i16 -21216, i16* %arrayidx.i, align 2
  store i16 -21216, i16* %arrayidx.1.i, align 2
  store i16 -21216, i16* %arrayidx.2.i, align 2
  store i16 -21216, i16* %arrayidx.3.i, align 2
  store i16 -21216, i16* %arrayidx.4.i, align 2
  store i16 -21216, i16* %arrayidx.5.i, align 2
  store i16 -21216, i16* %arrayidx.6.i, align 2
  store i16 7, i16* @g_2, align 2
  br label %func_1.exit

if.else.i:                                        ; preds = %lbl_8.i
  %tobool24.i = icmp eq i32 %tmp55.i, %conv.i
  br i1 %tobool24.i, label %if.end26.loopexit4.i, label %lbl_8.i

if.end26.loopexit4.i:                             ; preds = %if.else.i
  store i32 %xor.i, i32* @g_4, align 4
  %phitmp = zext i16 %tmp3.i to i32
  br label %func_1.exit

func_1.exit:                                      ; preds = %for.cond9.preheader.i, %if.end26.loopexit4.i
  %tmp = phi i32 [ 7, %for.cond9.preheader.i ], [ %phitmp, %if.end26.loopexit4.i ]
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
