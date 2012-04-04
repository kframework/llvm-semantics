; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020402-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.blockvector = type { i32, [2 x %struct.block*] }
%struct.block = type { i64, i64, %struct.symbol*, %struct.block*, i8, i32, [1 x %struct.symbol] }
%struct.symbol = type { i32, i8* }
%struct.symtab = type { %struct.blockvector* }

define %struct.blockvector* @blockvector_for_pc_sect(i64 %pc, %struct.symtab* nocapture %symtab) nounwind uwtable readonly {
entry:
  %blockvector = getelementptr inbounds %struct.symtab* %symtab, i64 0, i32 0
  %0 = load %struct.blockvector** %blockvector, align 8, !tbaa !0
  %nblocks = getelementptr inbounds %struct.blockvector* %0, i64 0, i32 0
  %1 = load i32* %nblocks, align 4, !tbaa !3
  %cmp18 = icmp sgt i32 %1, 1
  br i1 %cmp18, label %while.body, label %while.cond8

while.cond.while.cond8.preheader_crit_edge:       ; preds = %while.body
  %phitmp = sext i32 %bot.0.add2 to i64
  br label %while.cond8

while.body:                                       ; preds = %entry, %while.body
  %sub21 = phi i32 [ %sub, %while.body ], [ %1, %entry ]
  %top.020 = phi i32 [ %add2.top.0, %while.body ], [ %1, %entry ]
  %bot.019 = phi i32 [ %bot.0.add2, %while.body ], [ 0, %entry ]
  %add = add nsw i32 %sub21, 1
  %shr = ashr i32 %add, 1
  %add2 = add nsw i32 %shr, %bot.019
  %idxprom = sext i32 %add2 to i64
  %arrayidx4 = getelementptr inbounds %struct.blockvector* %0, i64 0, i32 1, i64 %idxprom
  %2 = load %struct.block** %arrayidx4, align 8, !tbaa !0
  %startaddr = getelementptr inbounds %struct.block* %2, i64 0, i32 0
  %3 = load i64* %startaddr, align 8, !tbaa !4
  %cmp5 = icmp ugt i64 %3, %pc
  %bot.0.add2 = select i1 %cmp5, i32 %bot.019, i32 %add2
  %add2.top.0 = select i1 %cmp5, i32 %add2, i32 %top.020
  %sub = sub nsw i32 %add2.top.0, %bot.0.add2
  %cmp = icmp sgt i32 %sub, 1
  br i1 %cmp, label %while.body, label %while.cond.while.cond8.preheader_crit_edge

while.cond8:                                      ; preds = %entry, %while.cond.while.cond8.preheader_crit_edge, %while.body10
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.body10 ], [ %phitmp, %while.cond.while.cond8.preheader_crit_edge ], [ 0, %entry ]
  %4 = trunc i64 %indvars.iv to i32
  %cmp9 = icmp sgt i32 %4, -1
  br i1 %cmp9, label %while.body10, label %return

while.body10:                                     ; preds = %while.cond8
  %arrayidx13 = getelementptr inbounds %struct.blockvector* %0, i64 0, i32 1, i64 %indvars.iv
  %5 = load %struct.block** %arrayidx13, align 8, !tbaa !0
  %endaddr = getelementptr inbounds %struct.block* %5, i64 0, i32 1
  %6 = load i64* %endaddr, align 8, !tbaa !4
  %cmp14 = icmp ugt i64 %6, %pc
  %indvars.iv.next = add i64 %indvars.iv, -1
  br i1 %cmp14, label %return, label %while.cond8

return:                                           ; preds = %while.cond8, %while.body10
  %retval.0 = phi %struct.blockvector* [ %0, %while.body10 ], [ null, %while.cond8 ]
  ret %struct.blockvector* %retval.0
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{metadata !"long long", metadata !1}
