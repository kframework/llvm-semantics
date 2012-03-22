; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr43835.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.PMC = type { i32 }
%struct.Pcc_cell = type { %struct.PMC*, i64, i64 }

define void @Parrot_gc_mark_PMC_alive_fun(i32* nocapture %interp, %struct.PMC* nocapture %pmc) noreturn nounwind uwtable noinline {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn

define void @foo(i32* %interp, %struct.Pcc_cell* %c) nounwind uwtable {
entry:
  tail call fastcc void @mark_cell(i32* %interp, %struct.Pcc_cell* %c)
  ret void
}

define internal fastcc void @mark_cell(i32* %interp, %struct.Pcc_cell* %c) nounwind uwtable noinline {
entry:
  %type = getelementptr inbounds %struct.Pcc_cell* %c, i64 0, i32 2
  %tmp1 = load i64* %type, align 8
  %cmp = icmp eq i64 %tmp1, 4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %p = getelementptr inbounds %struct.Pcc_cell* %c, i64 0, i32 0
  %tmp3 = load %struct.PMC** %p, align 8
  %tobool = icmp eq %struct.PMC* %tmp3, null
  br i1 %tobool, label %if.end, label %land.lhs.true4

land.lhs.true4:                                   ; preds = %land.lhs.true
  %flags = getelementptr inbounds %struct.PMC* %tmp3, i64 0, i32 0
  %tmp8 = load i32* %flags, align 4
  %and = and i32 %tmp8, 262144
  %tobool9 = icmp eq i32 %and, 0
  br i1 %tobool9, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true4
  tail call void @Parrot_gc_mark_PMC_alive_fun(i32* %interp, %struct.PMC* %tmp3)
  unreachable

if.end:                                           ; preds = %land.lhs.true4, %land.lhs.true, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %c = alloca %struct.Pcc_cell, align 8
  %p = getelementptr inbounds %struct.Pcc_cell* %c, i64 0, i32 0
  store %struct.PMC* null, %struct.PMC** %p, align 8
  %bla = getelementptr inbounds %struct.Pcc_cell* %c, i64 0, i32 1
  store i64 42, i64* %bla, align 8
  %type = getelementptr inbounds %struct.Pcc_cell* %c, i64 0, i32 2
  store i64 4, i64* %type, align 8
  call fastcc void @mark_cell(i32* %i, %struct.Pcc_cell* %c) nounwind
  ret i32 0
}
