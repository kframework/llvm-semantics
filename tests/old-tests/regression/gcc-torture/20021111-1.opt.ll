; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021111-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@aim_callhandler.i = internal unnamed_addr global i32 0, align 4

define i32 @aim_callhandler(i32 %sess, i32 %conn, i16 zeroext %family, i16 zeroext %type) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %conn, 0
  %aim_callhandler.i.promoted = load i32* @aim_callhandler.i, align 4
  br i1 %tobool, label %return, label %entry.entry.split_crit_edge

entry.entry.split_crit_edge:                      ; preds = %entry
  %phitmp = icmp eq i16 %type, -1
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.end9, %entry.entry.split_crit_edge
  %indvar = phi i32 [ %indvar.next, %if.end9 ], [ 0, %entry.entry.split_crit_edge ]
  %type.tr = phi i1 [ true, %if.end9 ], [ %phitmp, %entry.entry.split_crit_edge ]
  %inc1 = add i32 %aim_callhandler.i.promoted, %indvar
  br i1 %type.tr, label %return, label %if.end4

if.end4:                                          ; preds = %tailrecurse
  %cmp6 = icmp sgt i32 %inc1, 0
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  store i32 %inc1, i32* @aim_callhandler.i, align 4
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end4
  %indvar.next = add i32 %indvar, 1
  br label %tailrecurse

return:                                           ; preds = %tailrecurse, %entry
  %inc1.lcssa = phi i32 [ %aim_callhandler.i.promoted, %entry ], [ %inc1, %tailrecurse ]
  store i32 %inc1.lcssa, i32* @aim_callhandler.i, align 4
  ret i32 0
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %aim_callhandler.i.promoted.i = load i32* @aim_callhandler.i, align 4
  %tmp = add i32 %aim_callhandler.i.promoted.i, -1
  %tmp3 = icmp sgt i32 %aim_callhandler.i.promoted.i, 1
  %smax = select i1 %tmp3, i32 %aim_callhandler.i.promoted.i, i32 1
  %tmp4 = sub i32 %tmp, %smax
  %tmp5 = icmp eq i32 %tmp4, -1
  %umax = select i1 %tmp5, i32 -1, i32 -2
  %tmp6 = sub i32 %tmp, %umax
  br label %tailrecurse.i

tailrecurse.i:                                    ; preds = %if.end9.i, %entry
  %indvar.i = phi i32 [ %indvar.next.i, %if.end9.i ], [ 0, %entry ]
  %type.tr.i = phi i1 [ true, %if.end9.i ], [ false, %entry ]
  br i1 %type.tr.i, label %aim_callhandler.exit, label %if.end4.i

if.end4.i:                                        ; preds = %tailrecurse.i
  %inc1.i = add i32 %aim_callhandler.i.promoted.i, %indvar.i
  %cmp6.i = icmp sgt i32 %inc1.i, 0
  br i1 %cmp6.i, label %if.then8.i, label %if.end9.i

if.then8.i:                                       ; preds = %if.end4.i
  store i32 %tmp6, i32* @aim_callhandler.i, align 4
  tail call void @abort() noreturn nounwind
  unreachable

if.end9.i:                                        ; preds = %if.end4.i
  %indvar.next.i = add i32 %indvar.i, 1
  br label %tailrecurse.i

aim_callhandler.exit:                             ; preds = %tailrecurse.i
  store i32 %tmp6, i32* @aim_callhandler.i, align 4
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
