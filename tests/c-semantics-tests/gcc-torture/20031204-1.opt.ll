; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031204-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.addr = internal global [19 x i8] c"10.11.12.13:/hello\00", align 16

define i64 @in_aton(i8* nocapture %x) nounwind uwtable readnone {
entry:
  ret i64 168496141
}

define i64 @root_nfs_parse_addr(i8* %name) nounwind uwtable {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %cp.0 = phi i8* [ %name, %entry ], [ %incdec.ptr23.cp.1, %if.end ]
  %octets.0 = phi i32 [ 0, %entry ], [ %octets.1, %if.end ]
  %cmp = icmp slt i32 %octets.0, 4
  br i1 %cmp, label %while.cond1, label %while.end25

while.cond1:                                      ; preds = %while.cond, %while.cond1
  %cp.1 = phi i8* [ %incdec.ptr, %while.cond1 ], [ %cp.0, %while.cond ]
  %0 = load i8* %cp.1, align 1, !tbaa !0
  %.off = add i8 %0, -48
  %1 = icmp ult i8 %.off, 10
  %incdec.ptr = getelementptr inbounds i8* %cp.1, i64 1
  br i1 %1, label %while.cond1, label %while.end

while.end:                                        ; preds = %while.cond1
  %cmp8 = icmp eq i8* %cp.1, %cp.0
  br i1 %cmp8, label %while.end25, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %sub.ptr.lhs.cast = ptrtoint i8* %cp.1 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %cp.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp10 = icmp sgt i64 %sub.ptr.sub, 3
  br i1 %cmp10, label %while.end25, label %if.end

if.end:                                           ; preds = %lor.lhs.false
  %cmp13 = icmp eq i8 %0, 46
  %cmp16 = icmp eq i32 %octets.0, 3
  %or.cond = or i1 %cmp13, %cmp16
  %inc = zext i1 %or.cond to i32
  %octets.1 = add nsw i32 %inc, %octets.0
  %cmp20 = icmp slt i32 %octets.1, 4
  %incdec.ptr23.cp.1 = select i1 %cmp20, i8* %incdec.ptr, i8* %cp.1
  br label %while.cond

while.end25:                                      ; preds = %while.end, %lor.lhs.false, %while.cond
  %cp.3 = phi i8* [ %cp.1, %while.end ], [ %cp.1, %lor.lhs.false ], [ %cp.0, %while.cond ]
  %cmp26 = icmp eq i32 %octets.0, 4
  br i1 %cmp26, label %land.lhs.true, label %if.end43

land.lhs.true:                                    ; preds = %while.end25
  %2 = load i8* %cp.3, align 1, !tbaa !0
  switch i8 %2, label %if.end43 [
    i8 58, label %if.then39
    i8 0, label %if.end41
  ]

if.then39:                                        ; preds = %land.lhs.true
  %incdec.ptr40 = getelementptr inbounds i8* %cp.3, i64 1
  store i8 0, i8* %cp.3, align 1, !tbaa !0
  br label %if.end41

if.end41:                                         ; preds = %land.lhs.true, %if.then39
  %cp.4 = phi i8* [ %incdec.ptr40, %if.then39 ], [ %cp.3, %land.lhs.true ]
  %call42 = tail call i8* @strcpy(i8* %name, i8* %cp.4) nounwind
  br label %if.end43

if.end43:                                         ; preds = %land.lhs.true, %while.end25, %if.end41
  %addr.0 = phi i64 [ 168496141, %if.end41 ], [ -1, %land.lhs.true ], [ -1, %while.end25 ]
  ret i64 %addr.0
}

declare i8* @strcpy(i8*, i8* nocapture) nounwind

define i32 @main() nounwind uwtable {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %if.end.i, %entry
  %cp.0.i = phi i8* [ getelementptr inbounds ([19 x i8]* @main.addr, i64 0, i64 0), %entry ], [ %incdec.ptr23.cp.1.i, %if.end.i ]
  %octets.0.i = phi i32 [ 0, %entry ], [ %octets.1.i, %if.end.i ]
  %cmp.i = icmp slt i32 %octets.0.i, 4
  br i1 %cmp.i, label %while.cond1.i, label %while.end25.i

while.cond1.i:                                    ; preds = %while.cond.i, %while.cond1.i
  %cp.1.i = phi i8* [ %incdec.ptr.i, %while.cond1.i ], [ %cp.0.i, %while.cond.i ]
  %0 = load i8* %cp.1.i, align 1, !tbaa !0
  %.off.i = add i8 %0, -48
  %1 = icmp ult i8 %.off.i, 10
  %incdec.ptr.i = getelementptr inbounds i8* %cp.1.i, i64 1
  br i1 %1, label %while.cond1.i, label %while.end.i

while.end.i:                                      ; preds = %while.cond1.i
  %cmp8.i = icmp eq i8* %cp.1.i, %cp.0.i
  br i1 %cmp8.i, label %while.end25.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %while.end.i
  %sub.ptr.lhs.cast.i = ptrtoint i8* %cp.1.i to i64
  %sub.ptr.rhs.cast.i = ptrtoint i8* %cp.0.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %cmp10.i = icmp sgt i64 %sub.ptr.sub.i, 3
  br i1 %cmp10.i, label %while.end25.i, label %if.end.i

if.end.i:                                         ; preds = %lor.lhs.false.i
  %cmp13.i = icmp eq i8 %0, 46
  %cmp16.i = icmp eq i32 %octets.0.i, 3
  %or.cond.i = or i1 %cmp13.i, %cmp16.i
  %inc.i = zext i1 %or.cond.i to i32
  %octets.1.i = add nsw i32 %inc.i, %octets.0.i
  %cmp20.i = icmp slt i32 %octets.1.i, 4
  %incdec.ptr23.cp.1.i = select i1 %cmp20.i, i8* %incdec.ptr.i, i8* %cp.1.i
  br label %while.cond.i

while.end25.i:                                    ; preds = %lor.lhs.false.i, %while.end.i, %while.cond.i
  %cp.3.i = phi i8* [ %cp.1.i, %while.end.i ], [ %cp.1.i, %lor.lhs.false.i ], [ %cp.0.i, %while.cond.i ]
  %cmp26.i = icmp eq i32 %octets.0.i, 4
  br i1 %cmp26.i, label %land.lhs.true.i, label %if.then

land.lhs.true.i:                                  ; preds = %while.end25.i
  %2 = load i8* %cp.3.i, align 1, !tbaa !0
  switch i8 %2, label %if.then [
    i8 58, label %if.then39.i
    i8 0, label %if.end
  ]

if.then39.i:                                      ; preds = %land.lhs.true.i
  %incdec.ptr40.i = getelementptr inbounds i8* %cp.3.i, i64 1
  store i8 0, i8* %cp.3.i, align 1, !tbaa !0
  br label %if.end

if.then:                                          ; preds = %land.lhs.true.i, %while.end25.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then39.i, %land.lhs.true.i
  %cp.4.i = phi i8* [ %incdec.ptr40.i, %if.then39.i ], [ %cp.3.i, %land.lhs.true.i ]
  %call42.i = tail call i8* @strcpy(i8* getelementptr inbounds ([19 x i8]* @main.addr, i64 0, i64 0), i8* %cp.4.i) nounwind
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
