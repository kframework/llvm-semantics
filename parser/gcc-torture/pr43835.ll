; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr43835.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.PMC = type { i32 }
%struct.Pcc_cell = type { %struct.PMC*, i64, i64 }

define void @Parrot_gc_mark_PMC_alive_fun(i32* %interp, %struct.PMC* %pmc) nounwind uwtable noinline {
entry:
  %interp.addr = alloca i32*, align 8
  %pmc.addr = alloca %struct.PMC*, align 8
  store i32* %interp, i32** %interp.addr, align 8
  store %struct.PMC* %pmc, %struct.PMC** %pmc.addr, align 8
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn

define void @foo(i32* %interp, %struct.Pcc_cell* %c) nounwind uwtable {
entry:
  %interp.addr = alloca i32*, align 8
  %c.addr = alloca %struct.Pcc_cell*, align 8
  store i32* %interp, i32** %interp.addr, align 8
  store %struct.Pcc_cell* %c, %struct.Pcc_cell** %c.addr, align 8
  %tmp = load i32** %interp.addr, align 8
  %tmp1 = load %struct.Pcc_cell** %c.addr, align 8
  call void @mark_cell(i32* %tmp, %struct.Pcc_cell* %tmp1)
  ret void
}

define internal void @mark_cell(i32* %interp, %struct.Pcc_cell* %c) nounwind uwtable noinline {
entry:
  %interp.addr = alloca i32*, align 8
  %c.addr = alloca %struct.Pcc_cell*, align 8
  store i32* %interp, i32** %interp.addr, align 8
  store %struct.Pcc_cell* %c, %struct.Pcc_cell** %c.addr, align 8
  %tmp = load %struct.Pcc_cell** %c.addr, align 8
  %type = getelementptr inbounds %struct.Pcc_cell* %tmp, i32 0, i32 2
  %tmp1 = load i64* %type, align 8
  %cmp = icmp eq i64 %tmp1, 4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load %struct.Pcc_cell** %c.addr, align 8
  %p = getelementptr inbounds %struct.Pcc_cell* %tmp2, i32 0, i32 0
  %tmp3 = load %struct.PMC** %p, align 8
  %tobool = icmp ne %struct.PMC* %tmp3, null
  br i1 %tobool, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %land.lhs.true
  %tmp5 = load %struct.Pcc_cell** %c.addr, align 8
  %p6 = getelementptr inbounds %struct.Pcc_cell* %tmp5, i32 0, i32 0
  %tmp7 = load %struct.PMC** %p6, align 8
  %flags = getelementptr inbounds %struct.PMC* %tmp7, i32 0, i32 0
  %tmp8 = load i32* %flags, align 4
  %and = and i32 %tmp8, 262144
  %tobool9 = icmp ne i32 %and, 0
  br i1 %tobool9, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true4
  %tmp10 = load i32** %interp.addr, align 8
  %tmp11 = load %struct.Pcc_cell** %c.addr, align 8
  %p12 = getelementptr inbounds %struct.Pcc_cell* %tmp11, i32 0, i32 0
  %tmp13 = load %struct.PMC** %p12, align 8
  call void @Parrot_gc_mark_PMC_alive_fun(i32* %tmp10, %struct.PMC* %tmp13)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true4, %land.lhs.true, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca %struct.Pcc_cell, align 8
  store i32 0, i32* %retval
  %p = getelementptr inbounds %struct.Pcc_cell* %c, i32 0, i32 0
  store %struct.PMC* null, %struct.PMC** %p, align 8
  %bla = getelementptr inbounds %struct.Pcc_cell* %c, i32 0, i32 1
  store i64 42, i64* %bla, align 8
  %type = getelementptr inbounds %struct.Pcc_cell* %c, i32 0, i32 2
  store i64 4, i64* %type, align 8
  call void @foo(i32* %i, %struct.Pcc_cell* %c)
  ret i32 0
}
