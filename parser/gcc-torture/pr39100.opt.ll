; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr39100.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { %struct.E*, i16, i16, [4 x i8] }
%struct.C = type { %struct.E*, i16, i16 }
%struct.E = type { i32, %struct.E* }

@main.c = internal unnamed_addr constant %0 { %struct.E* null, i16 0, i16 0, [4 x i8] undef }, align 8

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

define %struct.C* @foo(%struct.C* %h, %struct.E* %x) nounwind uwtable noinline {
entry:
  %pl = alloca %struct.E*, align 8
  %nl = alloca %struct.E*, align 8
  store %struct.E* null, %struct.E** %pl, align 8
  store %struct.E* null, %struct.E** %nl, align 8
  %cp = getelementptr inbounds %struct.C* %h, i64 0, i32 2
  %cn = getelementptr inbounds %struct.C* %h, i64 0, i32 1
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.else, %entry
  %tmp245.ph = phi %struct.E** [ %nl, %entry ], [ %n2, %if.else ]
  %tmp233.ph = phi %struct.E** [ %pl, %entry ], [ %tmp233, %if.else ]
  %tmp211.ph = phi %struct.E* [ %x, %entry ], [ %tmp3, %if.else ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %if.then
  %tmp233 = phi %struct.E** [ %n2, %if.then ], [ %tmp233.ph, %while.cond.outer ]
  %tmp211 = phi %struct.E* [ %tmp3, %if.then ], [ %tmp211.ph, %while.cond.outer ]
  %tobool = icmp eq %struct.E* %tmp211, null
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %n2 = getelementptr inbounds %struct.E* %tmp211, i64 0, i32 1
  %tmp3 = load %struct.E** %n2, align 8
  %p = getelementptr inbounds %struct.E* %tmp211, i64 0, i32 0
  %tmp5 = load i32* %p, align 4
  %and = and i32 %tmp5, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %tmp7 = load i16* %cp, align 2
  %inc = add i16 %tmp7, 1
  store i16 %inc, i16* %cp, align 2
  store %struct.E* %tmp211, %struct.E** %tmp233, align 8
  br label %while.cond

if.else:                                          ; preds = %while.body
  %tmp14 = load i16* %cn, align 2
  %inc15 = add i16 %tmp14, 1
  store i16 %inc15, i16* %cn, align 2
  store %struct.E* %tmp211, %struct.E** %tmp245.ph, align 8
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond
  %tmp22 = load %struct.E** %nl, align 8
  store %struct.E* %tmp22, %struct.E** %tmp233, align 8
  store %struct.E* null, %struct.E** %tmp245.ph, align 8
  %tmp25 = load %struct.E** %pl, align 8
  %x27 = getelementptr inbounds %struct.C* %h, i64 0, i32 0
  store %struct.E* %tmp25, %struct.E** %x27, align 8
  ret %struct.C* %h
}

define i32 @main() nounwind uwtable {
entry:
  %c = alloca %struct.C, align 8
  %e = alloca [2 x %struct.E], align 16
  %tmp = bitcast %struct.C* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%0* @main.c to i8*), i64 16, i32 8, i1 false)
  %p = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0, i32 0
  store i32 0, i32* %p, align 16
  %n = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0, i32 1
  %arrayidx = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 1
  store %struct.E* %arrayidx, %struct.E** %n, align 8
  %p3 = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 1, i32 0
  store i32 1, i32* %p3, align 16
  %n4 = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 1, i32 1
  store %struct.E* null, %struct.E** %n4, align 8
  %arrayidx7 = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0
  %call = call %struct.C* @foo(%struct.C* %c, %struct.E* %arrayidx7)
  %cn = getelementptr inbounds %struct.C* %c, i64 0, i32 1
  %0 = bitcast i16* %cn to i32*
  %tmp8 = load i32* %0, align 8
  %1 = icmp eq i32 %tmp8, 65537
  br i1 %1, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %x = getelementptr inbounds %struct.C* %c, i64 0, i32 0
  %tmp14 = load %struct.E** %x, align 8
  %cmp16 = icmp eq %struct.E* %tmp14, %arrayidx
  br i1 %cmp16, label %if.end19, label %if.then18

if.then18:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end
  %tmp22 = load %struct.E** %n4, align 8
  %cmp24 = icmp eq %struct.E* %tmp22, %arrayidx7
  br i1 %cmp24, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end19
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end19
  %tmp30 = load %struct.E** %n, align 8
  %tobool = icmp eq %struct.E* %tmp30, null
  br i1 %tobool, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end27
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end27
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
