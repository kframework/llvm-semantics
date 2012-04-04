; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43835.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i32** %interp.addr, align 8
  %1 = load %struct.Pcc_cell** %c.addr, align 8
  call void @mark_cell(i32* %0, %struct.Pcc_cell* %1)
  ret void
}

define internal void @mark_cell(i32* %interp, %struct.Pcc_cell* %c) nounwind uwtable noinline {
entry:
  %interp.addr = alloca i32*, align 8
  %c.addr = alloca %struct.Pcc_cell*, align 8
  store i32* %interp, i32** %interp.addr, align 8
  store %struct.Pcc_cell* %c, %struct.Pcc_cell** %c.addr, align 8
  %0 = load %struct.Pcc_cell** %c.addr, align 8
  %type = getelementptr inbounds %struct.Pcc_cell* %0, i32 0, i32 2
  %1 = load i64* %type, align 8
  %cmp = icmp eq i64 %1, 4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.Pcc_cell** %c.addr, align 8
  %p = getelementptr inbounds %struct.Pcc_cell* %2, i32 0, i32 0
  %3 = load %struct.PMC** %p, align 8
  %tobool = icmp ne %struct.PMC* %3, null
  br i1 %tobool, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %4 = load %struct.Pcc_cell** %c.addr, align 8
  %p2 = getelementptr inbounds %struct.Pcc_cell* %4, i32 0, i32 0
  %5 = load %struct.PMC** %p2, align 8
  %flags = getelementptr inbounds %struct.PMC* %5, i32 0, i32 0
  %6 = load i32* %flags, align 4
  %and = and i32 %6, 262144
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true1
  %7 = load i32** %interp.addr, align 8
  %8 = load %struct.Pcc_cell** %c.addr, align 8
  %p4 = getelementptr inbounds %struct.Pcc_cell* %8, i32 0, i32 0
  %9 = load %struct.PMC** %p4, align 8
  call void @Parrot_gc_mark_PMC_alive_fun(i32* %7, %struct.PMC* %9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true1, %land.lhs.true, %entry
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
