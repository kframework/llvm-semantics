; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980223.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.object = type { i8*, i64 }

@nil = common global i32 0, align 4
@cons1 = global [2 x %struct.object] [%struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@cons2 = global [2 x %struct.object] [%struct.object { i8* bitcast ([2 x %struct.object]* @cons1 to i8*), i64 64 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16

define { i8*, i64 } @bar(i8* nocapture %blah.coerce0, i64 %blah.coerce1) noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define { i8*, i64 } @foo(i8* nocapture %x.coerce0, i64 %x.coerce1, i8* %y.coerce0, i64 %y.coerce1) nounwind uwtable {
entry:
  %.010 = bitcast i8* %x.coerce0 to i8**
  %tmp11 = load i8** %.010, align 8
  %.112 = getelementptr inbounds i8* %x.coerce0, i64 8
  %0 = bitcast i8* %.112 to i64*
  %tmp13 = load i64* %0, align 8
  %and = and i64 %tmp13, 64
  %tobool = icmp eq i64 %and, 0
  br i1 %tobool, label %if.end7, label %if.then

if.then:                                          ; preds = %entry
  %add.ptr = getelementptr inbounds i8* %tmp11, i64 16
  %add.ptr18.0 = bitcast i8* %add.ptr to i8**
  %tmp19 = load i8** %add.ptr18.0, align 8
  %add.ptr18.1 = getelementptr inbounds i8* %tmp11, i64 24
  %1 = bitcast i8* %add.ptr18.1 to i64*
  %tmp20 = load i64* %1, align 8
  %.1 = getelementptr inbounds i8* %tmp11, i64 8
  %2 = bitcast i8* %.1 to i64*
  %tmp9 = load i64* %2, align 8
  %and4 = and i64 %tmp9, 64
  %tobool5 = icmp eq i64 %and4, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.then
  %call = tail call { i8*, i64 } @bar(i8* undef, i64 undef)
  unreachable

if.end7:                                          ; preds = %if.then, %entry
  %y.115.0 = phi i64 [ %tmp20, %if.then ], [ %y.coerce1, %entry ]
  %y.014.0.in = phi i8* [ %tmp19, %if.then ], [ %y.coerce0, %entry ]
  %3 = insertvalue { i8*, i64 } undef, i8* %y.014.0.in, 0
  %4 = insertvalue { i8*, i64 } %3, i64 %y.115.0, 1
  ret { i8*, i64 } %4
}

define i32 @main() nounwind uwtable {
entry:
  %tmp13.i = load i64* getelementptr inbounds ([2 x %struct.object]* @cons2, i64 0, i64 0, i32 1), align 8
  %and.i = and i64 %tmp13.i, 64
  %tobool.i = icmp eq i64 %and.i, 0
  br i1 %tobool.i, label %foo.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %tmp11.i = load i8** getelementptr inbounds ([2 x %struct.object]* @cons2, i64 0, i64 0, i32 0), align 16
  %.1.i = getelementptr inbounds i8* %tmp11.i, i64 8
  %0 = bitcast i8* %.1.i to i64*
  %tmp9.i = load i64* %0, align 8
  %and4.i = and i64 %tmp9.i, 64
  %tobool5.i = icmp eq i64 %and4.i, 0
  br i1 %tobool5.i, label %foo.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.then.i
  %call.i = tail call { i8*, i64 } @bar(i8* undef, i64 undef) nounwind
  unreachable

foo.exit:                                         ; preds = %entry, %if.then.i
  ret i32 0
}
