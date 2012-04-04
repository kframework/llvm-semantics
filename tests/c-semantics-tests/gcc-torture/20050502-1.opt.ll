; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050502-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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

define i32 @bar(i8** nocapture %x) nounwind uwtable noinline {
entry:
  %0 = load i8** %x, align 8, !tbaa !0
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %x, align 8, !tbaa !0
  %1 = load i8* %0, align 1, !tbaa !1
  %conv = sext i8 %1 to i32
  ret i32 %conv
}

define i32 @baz(i32 %c) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp ne i32 %c, 64
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define void @foo(i8** nocapture %w, i8* nocapture %x, i1 zeroext %y, i1 zeroext %z) nounwind uwtable noinline {
entry:
  %call = tail call i32 @bar(i8** %w)
  %conv = trunc i32 %call to i8
  %brmerge = or i1 %y, %z
  br i1 %y, label %entry.split.us, label %entry.entry.split_crit_edge

entry.entry.split_crit_edge:                      ; preds = %entry
  br i1 %z, label %while.body.us28, label %entry.split.entry.split.split_crit_edge

entry.split.us:                                   ; preds = %entry
  br i1 %z, label %while.body.us.us, label %entry.split.us.entry.split.us.split_crit_edge

entry.split.us.entry.split.us.split_crit_edge:    ; preds = %entry.split.us
  br i1 %brmerge, label %while.body.us.us58, label %while.body.us

while.body.us.us:                                 ; preds = %entry.split.us, %while.body.backedge.us.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %while.body.backedge.us.us ], [ 0, %entry.split.us ]
  %c.0.us.us = phi i8 [ %conv3.us.us, %while.body.backedge.us.us ], [ %conv, %entry.split.us ]
  %i.0.us.us = phi i32 [ %phitmp87, %while.body.backedge.us.us ], [ 1, %entry.split.us ]
  %indvars.iv.next74 = add i64 %indvars.iv73, 1
  %arrayidx.us.us = getelementptr inbounds i8* %x, i64 %indvars.iv73
  store i8 %c.0.us.us, i8* %arrayidx.us.us, align 1, !tbaa !1
  %call2.us.us = tail call i32 @bar(i8** %w)
  %conv3.us.us = trunc i32 %call2.us.us to i8
  switch i8 %conv3.us.us, label %if.end14.us.us [
    i8 39, label %while.end
    i8 34, label %while.end
  ]

land.lhs.true18.us.us:                            ; preds = %if.end14.us.us
  %conv19.us.us = sext i8 %conv3.us.us to i32
  %call20.us.us = tail call i32 @baz(i32 %conv19.us.us)
  %tobool21.us.us = icmp eq i32 %call20.us.us, 0
  br i1 %tobool21.us.us, label %while.end, label %while.body.backedge.us.us

if.end14.us.us:                                   ; preds = %while.body.us.us
  br i1 %brmerge, label %while.body.backedge.us.us, label %land.lhs.true18.us.us

while.body.backedge.us.us:                        ; preds = %if.end14.us.us, %land.lhs.true18.us.us
  %phitmp87 = add i32 %i.0.us.us, 1
  br label %while.body.us.us

while.body.us.us58:                               ; preds = %entry.split.us.entry.split.us.split_crit_edge, %while.body.backedge.us.us72
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.body.backedge.us.us72 ], [ 0, %entry.split.us.entry.split.us.split_crit_edge ]
  %c.0.us.us59 = phi i8 [ %conv3.us.us65, %while.body.backedge.us.us72 ], [ %conv, %entry.split.us.entry.split.us.split_crit_edge ]
  %i.0.us.us60 = phi i32 [ %phitmp86, %while.body.backedge.us.us72 ], [ 1, %entry.split.us.entry.split.us.split_crit_edge ]
  %arrayidx.us.us63 = getelementptr inbounds i8* %x, i64 %indvars.iv
  store i8 %c.0.us.us59, i8* %arrayidx.us.us63, align 1, !tbaa !1
  %call2.us.us64 = tail call i32 @bar(i8** %w)
  %conv3.us.us65 = trunc i32 %call2.us.us64 to i8
  %cmp.us.us66 = icmp eq i8 %conv3.us.us65, 39
  br i1 %cmp.us.us66, label %while.end, label %while.body.backedge.us.us72

while.body.backedge.us.us72:                      ; preds = %while.body.us.us58
  %indvars.iv.next = add i64 %indvars.iv, 1
  %phitmp86 = add i32 %i.0.us.us60, 1
  br label %while.body.us.us58

while.body.us:                                    ; preds = %entry.split.us.entry.split.us.split_crit_edge, %while.body.backedge.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %while.body.backedge.us ], [ 0, %entry.split.us.entry.split.us.split_crit_edge ]
  %c.0.us = phi i8 [ %conv3.us, %while.body.backedge.us ], [ %conv, %entry.split.us.entry.split.us.split_crit_edge ]
  %i.0.us = phi i32 [ %phitmp85, %while.body.backedge.us ], [ 1, %entry.split.us.entry.split.us.split_crit_edge ]
  %indvars.iv.next80 = add i64 %indvars.iv79, 1
  %arrayidx.us = getelementptr inbounds i8* %x, i64 %indvars.iv79
  store i8 %c.0.us, i8* %arrayidx.us, align 1, !tbaa !1
  %call2.us = tail call i32 @bar(i8** %w)
  %conv3.us = trunc i32 %call2.us to i8
  %cmp.us = icmp eq i8 %conv3.us, 39
  br i1 %cmp.us, label %while.end, label %land.lhs.true18.us

land.lhs.true18.us:                               ; preds = %while.body.us
  %conv19.us = sext i8 %conv3.us to i32
  %call20.us = tail call i32 @baz(i32 %conv19.us)
  %tobool21.us = icmp eq i32 %call20.us, 0
  br i1 %tobool21.us, label %while.end, label %while.body.backedge.us

while.body.backedge.us:                           ; preds = %land.lhs.true18.us
  %phitmp85 = add i32 %i.0.us, 1
  br label %while.body.us

entry.split.entry.split.split_crit_edge:          ; preds = %entry.entry.split_crit_edge
  br i1 %brmerge, label %while.body.backedge.us57, label %land.lhs.true18

while.body.us28:                                  ; preds = %entry.entry.split_crit_edge, %while.body.backedge.us43
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %while.body.backedge.us43 ], [ 0, %entry.entry.split_crit_edge ]
  %c.0.us29 = phi i8 [ %conv3.us35, %while.body.backedge.us43 ], [ %conv, %entry.entry.split_crit_edge ]
  %i.0.us30 = phi i32 [ %phitmp84, %while.body.backedge.us43 ], [ 1, %entry.entry.split_crit_edge ]
  %indvars.iv.next78 = add i64 %indvars.iv77, 1
  %arrayidx.us33 = getelementptr inbounds i8* %x, i64 %indvars.iv77
  store i8 %c.0.us29, i8* %arrayidx.us33, align 1, !tbaa !1
  %call2.us34 = tail call i32 @bar(i8** %w)
  %conv3.us35 = trunc i32 %call2.us34 to i8
  %cmp11.us36 = icmp eq i8 %conv3.us35, 34
  br i1 %cmp11.us36, label %while.end, label %if.end14.us42

land.lhs.true18.us38:                             ; preds = %if.end14.us42
  %conv19.us39 = sext i8 %conv3.us35 to i32
  %call20.us40 = tail call i32 @baz(i32 %conv19.us39)
  %tobool21.us41 = icmp eq i32 %call20.us40, 0
  br i1 %tobool21.us41, label %while.end, label %while.body.backedge.us43

if.end14.us42:                                    ; preds = %while.body.us28
  br i1 %brmerge, label %while.body.backedge.us43, label %land.lhs.true18.us38

while.body.backedge.us43:                         ; preds = %if.end14.us42, %land.lhs.true18.us38
  %phitmp84 = add i32 %i.0.us30, 1
  br label %while.body.us28

while.body.backedge.us57:                         ; preds = %entry.split.entry.split.split_crit_edge, %while.body.backedge.us57
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %while.body.backedge.us57 ], [ 0, %entry.split.entry.split.split_crit_edge ]
  %c.0.us45 = phi i8 [ %conv3.us51, %while.body.backedge.us57 ], [ %conv, %entry.split.entry.split.split_crit_edge ]
  %indvars.iv.next76 = add i64 %indvars.iv75, 1
  %arrayidx.us49 = getelementptr inbounds i8* %x, i64 %indvars.iv75
  store i8 %c.0.us45, i8* %arrayidx.us49, align 1, !tbaa !1
  %call2.us50 = tail call i32 @bar(i8** %w)
  %conv3.us51 = trunc i32 %call2.us50 to i8
  br label %while.body.backedge.us57

land.lhs.true18:                                  ; preds = %entry.split.entry.split.split_crit_edge, %while.body.backedge
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %while.body.backedge ], [ 0, %entry.split.entry.split.split_crit_edge ]
  %c.0 = phi i8 [ %conv3, %while.body.backedge ], [ %conv, %entry.split.entry.split.split_crit_edge ]
  %i.0 = phi i32 [ %phitmp, %while.body.backedge ], [ 1, %entry.split.entry.split.split_crit_edge ]
  %arrayidx = getelementptr inbounds i8* %x, i64 %indvars.iv82
  store i8 %c.0, i8* %arrayidx, align 1, !tbaa !1
  %call2 = tail call i32 @bar(i8** %w)
  %conv3 = trunc i32 %call2 to i8
  %conv19 = sext i8 %conv3 to i32
  %call20 = tail call i32 @baz(i32 %conv19)
  %tobool21 = icmp eq i32 %call20, 0
  br i1 %tobool21, label %while.end, label %while.body.backedge

while.body.backedge:                              ; preds = %land.lhs.true18
  %indvars.iv.next83 = add i64 %indvars.iv82, 1
  %phitmp = add i32 %i.0, 1
  br label %land.lhs.true18

while.end:                                        ; preds = %while.body.us.us, %while.body.us.us, %land.lhs.true18.us38, %while.body.us28, %land.lhs.true18, %land.lhs.true18.us.us, %while.body.us, %land.lhs.true18.us, %while.body.us.us58
  %inc.lcssa = phi i32 [ %i.0.us.us, %land.lhs.true18.us.us ], [ %i.0.us.us, %while.body.us.us ], [ %i.0.us.us60, %while.body.us.us58 ], [ %i.0.us, %land.lhs.true18.us ], [ %i.0.us, %while.body.us ], [ %i.0.us30, %land.lhs.true18.us38 ], [ %i.0.us30, %while.body.us28 ], [ %i.0, %land.lhs.true18 ], [ %i.0.us.us, %while.body.us.us ]
  %idxprom24 = sext i32 %inc.lcssa to i64
  %arrayidx25 = getelementptr inbounds i8* %x, i64 %idxprom24
  store i8 0, i8* %arrayidx25, align 1, !tbaa !1
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %buf = alloca [64 x i8], align 16
  %p = alloca i8*, align 8
  store i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i8** %p, align 8, !tbaa !0
  %arraydecay = getelementptr inbounds [64 x i8]* %buf, i64 0, i64 0
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext true, i1 zeroext false)
  %0 = load i8** %p, align 8, !tbaa !0
  %call = call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0)) nounwind
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
  store i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i8** %p, align 8, !tbaa !0
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext false, i1 zeroext true)
  %1 = load i8** %p, align 8, !tbaa !0
  %call5 = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) nounwind
  %cmp6 = icmp eq i32 %call5, 0
  br i1 %cmp6, label %lor.lhs.false7, label %if.then11

lor.lhs.false7:                                   ; preds = %if.end
  %call9 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([8 x i8]* @.str5, i64 0, i64 0)) nounwind
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %lor.lhs.false7, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %lor.lhs.false7
  store i8* getelementptr inbounds ([11 x i8]* @.str6, i64 0, i64 0), i8** %p, align 8, !tbaa !0
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext true, i1 zeroext true)
  %2 = load i8** %p, align 8, !tbaa !0
  %call14 = call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([6 x i8]* @.str7, i64 0, i64 0)) nounwind
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %lor.lhs.false16, label %if.then20

lor.lhs.false16:                                  ; preds = %if.end12
  %call18 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8]* @.str8, i64 0, i64 0)) nounwind
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %lor.lhs.false16, %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %lor.lhs.false16
  store i8* getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0), i8** %p, align 8, !tbaa !0
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext true, i1 zeroext true)
  %3 = load i8** %p, align 8, !tbaa !0
  %call23 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([5 x i8]* @.str10, i64 0, i64 0)) nounwind
  %cmp24 = icmp eq i32 %call23, 0
  br i1 %cmp24, label %lor.lhs.false25, label %if.then29

lor.lhs.false25:                                  ; preds = %if.end21
  %call27 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([7 x i8]* @.str11, i64 0, i64 0)) nounwind
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.end30, label %if.then29

if.then29:                                        ; preds = %lor.lhs.false25, %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %lor.lhs.false25
  store i8* getelementptr inbounds ([10 x i8]* @.str12, i64 0, i64 0), i8** %p, align 8, !tbaa !0
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext false, i1 zeroext false)
  %4 = load i8** %p, align 8, !tbaa !0
  %call32 = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0)) nounwind
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %lor.lhs.false34, label %if.then38

lor.lhs.false34:                                  ; preds = %if.end30
  %call36 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([7 x i8]* @.str14, i64 0, i64 0)) nounwind
  %cmp37 = icmp eq i32 %call36, 0
  br i1 %cmp37, label %if.end39, label %if.then38

if.then38:                                        ; preds = %lor.lhs.false34, %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %lor.lhs.false34
  ret i32 0
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
