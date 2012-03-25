; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050502-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"abcde'fgh\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"ABCDEFG\22HI\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"HI\00", align 1
@.str5 = private unnamed_addr constant [8 x i8] c"ABCDEFG\00", align 1
@.str6 = private unnamed_addr constant [11 x i8] c"abcd\22e'fgh\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"e'fgh\00", align 1
@.str8 = private unnamed_addr constant [5 x i8] c"abcd\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"ABCDEF'G\22HI\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"G\22HI\00", align 1
@.str11 = private unnamed_addr constant [7 x i8] c"ABCDEF\00", align 1
@.str12 = private unnamed_addr constant [10 x i8] c"abcdef@gh\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"gh\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"abcdef\00", align 1

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

define i32 @bar(i8** nocapture %x) nounwind uwtable noinline {
entry:
  %tmp1 = load i8** %x, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp1, i64 1
  store i8* %incdec.ptr, i8** %x, align 8
  %tmp2 = load i8* %tmp1, align 1
  %conv = sext i8 %tmp2 to i32
  ret i32 %conv
}

define i32 @baz(i32 %c) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp ne i32 %c, 64
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define void @foo(i8** %w, i8* %x, i1 zeroext %y, i1 zeroext %z) nounwind uwtable noinline {
entry:
  %call = tail call i32 @bar(i8** %w)
  %conv = trunc i32 %call to i8
  %brmerge = or i1 %y, %z
  br i1 %y, label %entry.split.us, label %entry.entry.split_crit_edge

entry.entry.split_crit_edge:                      ; preds = %entry
  br i1 %z, label %entry.split.split.us, label %entry.split.entry.split.split_crit_edge

entry.split.us:                                   ; preds = %entry
  br i1 %z, label %entry.split.us.split.us, label %entry.split.us.entry.split.us.split_crit_edge

entry.split.us.entry.split.us.split_crit_edge:    ; preds = %entry.split.us
  br i1 %brmerge, label %while.body.us.us44, label %while.body.us

entry.split.us.split.us:                          ; preds = %entry.split.us
  br i1 %brmerge, label %while.body.us.us.us, label %while.body.us.us

while.body.us.us.us:                              ; preds = %while.body.us.us.us, %entry.split.us.split.us
  %indvar = phi i64 [ 0, %entry.split.us.split.us ], [ %tmp, %while.body.us.us.us ]
  %tmp308.us.us.us = phi i8 [ %conv, %entry.split.us.split.us ], [ %conv8.us.us.us, %while.body.us.us.us ]
  %arrayidx.us.us.us = getelementptr i8* %x, i64 %indvar
  %tmp = add i64 %indvar, 1
  store i8 %tmp308.us.us.us, i8* %arrayidx.us.us.us, align 1
  %call7.us.us.us = tail call i32 @bar(i8** %w)
  %conv8.us.us.us = trunc i32 %call7.us.us.us to i8
  switch i8 %conv8.us.us.us, label %while.body.us.us.us [
    i8 39, label %while.end
    i8 34, label %while.end
  ]

while.body.us.us:                                 ; preds = %land.lhs.true29.us.us, %entry.split.us.split.us
  %indvar68 = phi i64 [ 0, %entry.split.us.split.us ], [ %tmp70, %land.lhs.true29.us.us ]
  %tmp308.us.us = phi i8 [ %conv, %entry.split.us.split.us ], [ %conv8.us.us, %land.lhs.true29.us.us ]
  %arrayidx.us.us = getelementptr i8* %x, i64 %indvar68
  %tmp70 = add i64 %indvar68, 1
  store i8 %tmp308.us.us, i8* %arrayidx.us.us, align 1
  %call7.us.us = tail call i32 @bar(i8** %w)
  %conv8.us.us = trunc i32 %call7.us.us to i8
  switch i8 %conv8.us.us, label %land.lhs.true29.us.us [
    i8 39, label %while.end
    i8 34, label %while.end
  ]

land.lhs.true29.us.us:                            ; preds = %while.body.us.us
  %conv31.us.us = sext i8 %conv8.us.us to i32
  %call32.us.us = tail call i32 @baz(i32 %conv31.us.us)
  %tobool33.us.us = icmp eq i32 %call32.us.us, 0
  br i1 %tobool33.us.us, label %while.end, label %while.body.us.us

while.body.us.us44:                               ; preds = %while.body.us.us44, %entry.split.us.entry.split.us.split_crit_edge
  %indvar64 = phi i64 [ 0, %entry.split.us.entry.split.us.split_crit_edge ], [ %tmp66, %while.body.us.us44 ]
  %tmp308.us.us46 = phi i8 [ %conv, %entry.split.us.entry.split.us.split_crit_edge ], [ %conv8.us.us51, %while.body.us.us44 ]
  %arrayidx.us.us49 = getelementptr i8* %x, i64 %indvar64
  %tmp66 = add i64 %indvar64, 1
  store i8 %tmp308.us.us46, i8* %arrayidx.us.us49, align 1
  %call7.us.us50 = tail call i32 @bar(i8** %w)
  %conv8.us.us51 = trunc i32 %call7.us.us50 to i8
  %cmp.us.us52 = icmp eq i8 %conv8.us.us51, 39
  br i1 %cmp.us.us52, label %while.end, label %while.body.us.us44

while.body.us:                                    ; preds = %land.lhs.true29.us, %entry.split.us.entry.split.us.split_crit_edge
  %indvar78 = phi i64 [ 0, %entry.split.us.entry.split.us.split_crit_edge ], [ %tmp80, %land.lhs.true29.us ]
  %tmp308.us = phi i8 [ %conv, %entry.split.us.entry.split.us.split_crit_edge ], [ %conv8.us, %land.lhs.true29.us ]
  %arrayidx.us = getelementptr i8* %x, i64 %indvar78
  %tmp80 = add i64 %indvar78, 1
  store i8 %tmp308.us, i8* %arrayidx.us, align 1
  %call7.us = tail call i32 @bar(i8** %w)
  %conv8.us = trunc i32 %call7.us to i8
  %cmp.us = icmp eq i8 %conv8.us, 39
  br i1 %cmp.us, label %while.end, label %land.lhs.true29.us

land.lhs.true29.us:                               ; preds = %while.body.us
  %conv31.us = sext i8 %conv8.us to i32
  %call32.us = tail call i32 @baz(i32 %conv31.us)
  %tobool33.us = icmp eq i32 %call32.us, 0
  br i1 %tobool33.us, label %while.end, label %while.body.us

entry.split.entry.split.split_crit_edge:          ; preds = %entry.entry.split_crit_edge
  br i1 %brmerge, label %while.body.backedge.us43, label %land.lhs.true29

entry.split.split.us:                             ; preds = %entry.entry.split_crit_edge
  br i1 %brmerge, label %while.body.us14.us, label %while.body.us14

while.body.us14.us:                               ; preds = %while.body.us14.us, %entry.split.split.us
  %indvar60 = phi i64 [ 0, %entry.split.split.us ], [ %tmp62, %while.body.us14.us ]
  %tmp308.us16.us = phi i8 [ %conv, %entry.split.split.us ], [ %conv8.us21.us, %while.body.us14.us ]
  %arrayidx.us19.us = getelementptr i8* %x, i64 %indvar60
  %tmp62 = add i64 %indvar60, 1
  store i8 %tmp308.us16.us, i8* %arrayidx.us19.us, align 1
  %call7.us20.us = tail call i32 @bar(i8** %w)
  %conv8.us21.us = trunc i32 %call7.us20.us to i8
  %cmp20.us22.us = icmp eq i8 %conv8.us21.us, 34
  br i1 %cmp20.us22.us, label %while.end, label %while.body.us14.us

while.body.us14:                                  ; preds = %land.lhs.true29.us24, %entry.split.split.us
  %indvar74 = phi i64 [ 0, %entry.split.split.us ], [ %tmp76, %land.lhs.true29.us24 ]
  %tmp308.us16 = phi i8 [ %conv, %entry.split.split.us ], [ %conv8.us21, %land.lhs.true29.us24 ]
  %arrayidx.us19 = getelementptr i8* %x, i64 %indvar74
  %tmp76 = add i64 %indvar74, 1
  store i8 %tmp308.us16, i8* %arrayidx.us19, align 1
  %call7.us20 = tail call i32 @bar(i8** %w)
  %conv8.us21 = trunc i32 %call7.us20 to i8
  %cmp20.us22 = icmp eq i8 %conv8.us21, 34
  br i1 %cmp20.us22, label %while.end, label %land.lhs.true29.us24

land.lhs.true29.us24:                             ; preds = %while.body.us14
  %conv31.us25 = sext i8 %conv8.us21 to i32
  %call32.us26 = tail call i32 @baz(i32 %conv31.us25)
  %tobool33.us27 = icmp eq i32 %call32.us26, 0
  br i1 %tobool33.us27, label %while.end, label %while.body.us14

while.body.backedge.us43:                         ; preds = %entry.split.entry.split.split_crit_edge, %while.body.backedge.us43
  %indvar72 = phi i64 [ %indvar.next73, %while.body.backedge.us43 ], [ 0, %entry.split.entry.split.split_crit_edge ]
  %tmp308.us32 = phi i8 [ %conv8.us37, %while.body.backedge.us43 ], [ %conv, %entry.split.entry.split.split_crit_edge ]
  %arrayidx.us35 = getelementptr i8* %x, i64 %indvar72
  store i8 %tmp308.us32, i8* %arrayidx.us35, align 1
  %call7.us36 = tail call i32 @bar(i8** %w)
  %conv8.us37 = trunc i32 %call7.us36 to i8
  %indvar.next73 = add i64 %indvar72, 1
  br label %while.body.backedge.us43

land.lhs.true29:                                  ; preds = %land.lhs.true29, %entry.split.entry.split.split_crit_edge
  %indvar83 = phi i64 [ 0, %entry.split.entry.split.split_crit_edge ], [ %tmp85, %land.lhs.true29 ]
  %tmp308 = phi i8 [ %conv, %entry.split.entry.split.split_crit_edge ], [ %conv8, %land.lhs.true29 ]
  %tmp85 = add i64 %indvar83, 1
  %arrayidx = getelementptr i8* %x, i64 %indvar83
  store i8 %tmp308, i8* %arrayidx, align 1
  %call7 = tail call i32 @bar(i8** %w)
  %conv8 = trunc i32 %call7 to i8
  %conv31 = sext i8 %conv8 to i32
  %call32 = tail call i32 @baz(i32 %conv31)
  %tobool33 = icmp eq i32 %call32, 0
  br i1 %tobool33, label %while.end, label %land.lhs.true29

while.end:                                        ; preds = %while.body.us.us, %while.body.us.us, %while.body.us.us.us, %while.body.us.us.us, %land.lhs.true29.us24, %while.body.us14, %while.body.us14.us, %land.lhs.true29, %land.lhs.true29.us.us, %while.body.us, %land.lhs.true29.us, %while.body.us.us44
  %inc.lcssa = phi i64 [ %tmp, %while.body.us.us.us ], [ %tmp70, %while.body.us.us ], [ %tmp70, %land.lhs.true29.us.us ], [ %tmp66, %while.body.us.us44 ], [ %tmp80, %land.lhs.true29.us ], [ %tmp80, %while.body.us ], [ %tmp62, %while.body.us14.us ], [ %tmp76, %while.body.us14 ], [ %tmp76, %land.lhs.true29.us24 ], [ %tmp85, %land.lhs.true29 ], [ %tmp, %while.body.us.us.us ], [ %tmp70, %while.body.us.us ]
  %sext = shl i64 %inc.lcssa, 32
  %idxprom37 = ashr exact i64 %sext, 32
  %arrayidx39 = getelementptr inbounds i8* %x, i64 %idxprom37
  store i8 0, i8* %arrayidx39, align 1
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %buf = alloca [64 x i8], align 16
  %p = alloca i8*, align 8
  store i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i8** %p, align 8
  %arraydecay = getelementptr inbounds [64 x i8]* %buf, i64 0, i64 0
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext true, i1 zeroext false)
  %tmp = load i8** %p, align 8
  %call = call i32 @strcmp(i8* %tmp, i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0)) nounwind
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %call2 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0)) nounwind
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  store i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i8** %p, align 8
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext false, i1 zeroext true)
  %tmp5 = load i8** %p, align 8
  %call6 = call i32 @strcmp(i8* %tmp5, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) nounwind
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %lor.lhs.false8, label %if.then12

lor.lhs.false8:                                   ; preds = %if.end
  %call10 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([8 x i8]* @.str5, i64 0, i64 0)) nounwind
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.end13, label %if.then12

if.then12:                                        ; preds = %lor.lhs.false8, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %lor.lhs.false8
  store i8* getelementptr inbounds ([11 x i8]* @.str6, i64 0, i64 0), i8** %p, align 8
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext true, i1 zeroext true)
  %tmp15 = load i8** %p, align 8
  %call16 = call i32 @strcmp(i8* %tmp15, i8* getelementptr inbounds ([6 x i8]* @.str7, i64 0, i64 0)) nounwind
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %lor.lhs.false18, label %if.then22

lor.lhs.false18:                                  ; preds = %if.end13
  %call20 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8]* @.str8, i64 0, i64 0)) nounwind
  %cmp21 = icmp eq i32 %call20, 0
  br i1 %cmp21, label %if.end23, label %if.then22

if.then22:                                        ; preds = %lor.lhs.false18, %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %lor.lhs.false18
  store i8* getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0), i8** %p, align 8
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext true, i1 zeroext true)
  %tmp25 = load i8** %p, align 8
  %call26 = call i32 @strcmp(i8* %tmp25, i8* getelementptr inbounds ([5 x i8]* @.str10, i64 0, i64 0)) nounwind
  %cmp27 = icmp eq i32 %call26, 0
  br i1 %cmp27, label %lor.lhs.false28, label %if.then32

lor.lhs.false28:                                  ; preds = %if.end23
  %call30 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([7 x i8]* @.str11, i64 0, i64 0)) nounwind
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %if.end33, label %if.then32

if.then32:                                        ; preds = %lor.lhs.false28, %if.end23
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %lor.lhs.false28
  store i8* getelementptr inbounds ([10 x i8]* @.str12, i64 0, i64 0), i8** %p, align 8
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext false, i1 zeroext false)
  %tmp35 = load i8** %p, align 8
  %call36 = call i32 @strcmp(i8* %tmp35, i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0)) nounwind
  %cmp37 = icmp eq i32 %call36, 0
  br i1 %cmp37, label %lor.lhs.false38, label %if.then42

lor.lhs.false38:                                  ; preds = %if.end33
  %call40 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([7 x i8]* @.str14, i64 0, i64 0)) nounwind
  %cmp41 = icmp eq i32 %call40, 0
  br i1 %cmp41, label %if.end43, label %if.then42

if.then42:                                        ; preds = %lor.lhs.false38, %if.end33
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %lor.lhs.false38
  ret i32 0
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare void @abort() noreturn nounwind
