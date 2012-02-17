; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020406-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.DUPFFstruct = type { i32, i32, i32* }

@.str = private unnamed_addr constant [40 x i8] c"DUPFFexgcd called on degrees %d and %d\0A\00", align 1
@.str1 = private unnamed_addr constant [41 x i8] c"calling DUPFFexgcd on degrees %d and %d\0A\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @FFmul(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  ret i32 %tmp
}

define i32 @DUPFFdeg(%struct.DUPFFstruct* %f) nounwind uwtable {
entry:
  %f.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %f.addr, align 8
  %tmp = load %struct.DUPFFstruct** %f.addr, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %tmp, i32 0, i32 1
  %tmp1 = load i32* %deg, align 4
  ret i32 %tmp1
}

define %struct.DUPFFstruct* @DUPFFnew(i32 %maxdeg) nounwind uwtable {
entry:
  %maxdeg.addr = alloca i32, align 4
  %ans = alloca %struct.DUPFFstruct*, align 8
  store i32 %maxdeg, i32* %maxdeg.addr, align 4
  %call = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.DUPFFstruct*
  store %struct.DUPFFstruct* %0, %struct.DUPFFstruct** %ans, align 8
  %tmp = load %struct.DUPFFstruct** %ans, align 8
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %tmp, i32 0, i32 2
  store i32* null, i32** %coeffs, align 8
  %tmp1 = load i32* %maxdeg.addr, align 4
  %cmp = icmp sge i32 %tmp1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %maxdeg.addr, align 4
  %add = add nsw i32 %tmp2, 1
  %conv = sext i32 %add to i64
  %call3 = call noalias i8* @calloc(i64 %conv, i64 4) nounwind
  %1 = bitcast i8* %call3 to i32*
  %tmp4 = load %struct.DUPFFstruct** %ans, align 8
  %coeffs5 = getelementptr inbounds %struct.DUPFFstruct* %tmp4, i32 0, i32 2
  store i32* %1, i32** %coeffs5, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp6 = load i32* %maxdeg.addr, align 4
  %tmp7 = load %struct.DUPFFstruct** %ans, align 8
  %maxdeg8 = getelementptr inbounds %struct.DUPFFstruct* %tmp7, i32 0, i32 0
  store i32 %tmp6, i32* %maxdeg8, align 4
  %tmp9 = load %struct.DUPFFstruct** %ans, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %tmp9, i32 0, i32 1
  store i32 -1, i32* %deg, align 4
  %tmp10 = load %struct.DUPFFstruct** %ans, align 8
  ret %struct.DUPFFstruct* %tmp10
}

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @calloc(i64, i64) nounwind

define void @DUPFFfree(%struct.DUPFFstruct* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %x.addr, align 8
  ret void
}

define void @DUPFFswap(%struct.DUPFFstruct* %x, %struct.DUPFFstruct* %y) nounwind uwtable {
entry:
  %x.addr = alloca %struct.DUPFFstruct*, align 8
  %y.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %x.addr, align 8
  store %struct.DUPFFstruct* %y, %struct.DUPFFstruct** %y.addr, align 8
  ret void
}

define %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %x.addr, align 8
  %tmp = load %struct.DUPFFstruct** %x.addr, align 8
  ret %struct.DUPFFstruct* %tmp
}

define void @DUPFFshift_add(%struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g, i32 %deg, i32 %coeff) nounwind uwtable {
entry:
  %f.addr = alloca %struct.DUPFFstruct*, align 8
  %g.addr = alloca %struct.DUPFFstruct*, align 8
  %deg.addr = alloca i32, align 4
  %coeff.addr = alloca i32, align 4
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %f.addr, align 8
  store %struct.DUPFFstruct* %g, %struct.DUPFFstruct** %g.addr, align 8
  store i32 %deg, i32* %deg.addr, align 4
  store i32 %coeff, i32* %coeff.addr, align 4
  ret void
}

define %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %fcofac, %struct.DUPFFstruct** %gcofac, %struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g) nounwind uwtable {
entry:
  %retval = alloca %struct.DUPFFstruct*, align 8
  %fcofac.addr = alloca %struct.DUPFFstruct**, align 8
  %gcofac.addr = alloca %struct.DUPFFstruct**, align 8
  %f.addr = alloca %struct.DUPFFstruct*, align 8
  %g.addr = alloca %struct.DUPFFstruct*, align 8
  %u = alloca %struct.DUPFFstruct*, align 8
  %v = alloca %struct.DUPFFstruct*, align 8
  %uf = alloca %struct.DUPFFstruct*, align 8
  %ug = alloca %struct.DUPFFstruct*, align 8
  %vf = alloca %struct.DUPFFstruct*, align 8
  %vg = alloca %struct.DUPFFstruct*, align 8
  %q = alloca i32, align 4
  %lcu = alloca i32, align 4
  %lcvrecip = alloca i32, align 4
  %p = alloca i32, align 4
  %df = alloca i32, align 4
  %dg = alloca i32, align 4
  %du = alloca i32, align 4
  %dv = alloca i32, align 4
  store %struct.DUPFFstruct** %fcofac, %struct.DUPFFstruct*** %fcofac.addr, align 8
  store %struct.DUPFFstruct** %gcofac, %struct.DUPFFstruct*** %gcofac.addr, align 8
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %f.addr, align 8
  store %struct.DUPFFstruct* %g, %struct.DUPFFstruct** %g.addr, align 8
  %tmp = load %struct.DUPFFstruct** %f.addr, align 8
  %call = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp)
  %tmp1 = load %struct.DUPFFstruct** %g.addr, align 8
  %call2 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp1)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i32 0, i32 0), i32 %call, i32 %call2)
  %tmp4 = load %struct.DUPFFstruct** %f.addr, align 8
  %call5 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp4)
  %tmp6 = load %struct.DUPFFstruct** %g.addr, align 8
  %call7 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp6)
  %cmp = icmp slt i32 %call5, %call7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp8 = load %struct.DUPFFstruct*** %gcofac.addr, align 8
  %tmp9 = load %struct.DUPFFstruct*** %fcofac.addr, align 8
  %tmp10 = load %struct.DUPFFstruct** %g.addr, align 8
  %tmp11 = load %struct.DUPFFstruct** %f.addr, align 8
  %call12 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %tmp8, %struct.DUPFFstruct** %tmp9, %struct.DUPFFstruct* %tmp10, %struct.DUPFFstruct* %tmp11)
  store %struct.DUPFFstruct* %call12, %struct.DUPFFstruct** %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp13 = load %struct.DUPFFstruct** %f.addr, align 8
  %call14 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp13)
  %cmp15 = icmp ne i32 %call14, 2
  br i1 %cmp15, label %if.then19, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %tmp16 = load %struct.DUPFFstruct** %g.addr, align 8
  %call17 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp16)
  %cmp18 = icmp ne i32 %call17, 1
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %lor.lhs.false
  %tmp21 = load %struct.DUPFFstruct** %f.addr, align 8
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %tmp21, i32 0, i32 2
  %tmp22 = load i32** %coeffs, align 8
  %arrayidx = getelementptr inbounds i32* %tmp22, i64 0
  %tmp23 = load i32* %arrayidx
  %cmp24 = icmp eq i32 %tmp23, 0
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %if.end20
  %tmp26 = load %struct.DUPFFstruct** %f.addr, align 8
  store %struct.DUPFFstruct* %tmp26, %struct.DUPFFstruct** %retval
  br label %return

if.end27:                                         ; preds = %if.end20
  store i32 2, i32* %p, align 4
  %tmp28 = load %struct.DUPFFstruct** %f.addr, align 8
  %call29 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp28)
  store i32 %call29, i32* %df, align 4
  %tmp30 = load i32* %df, align 4
  %cmp31 = icmp slt i32 %tmp30, 0
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end27
  store i32 0, i32* %df, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end27
  %tmp34 = load %struct.DUPFFstruct** %g.addr, align 8
  %call35 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp34)
  store i32 %call35, i32* %dg, align 4
  %tmp36 = load i32* %dg, align 4
  %cmp37 = icmp slt i32 %tmp36, 0
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end33
  store i32 0, i32* %dg, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %if.end33
  %tmp40 = load %struct.DUPFFstruct** %f.addr, align 8
  %call41 = call %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %tmp40)
  store %struct.DUPFFstruct* %call41, %struct.DUPFFstruct** %u, align 8
  %tmp42 = load %struct.DUPFFstruct** %g.addr, align 8
  %call43 = call %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %tmp42)
  store %struct.DUPFFstruct* %call43, %struct.DUPFFstruct** %v, align 8
  %tmp44 = load i32* %dg, align 4
  %call45 = call %struct.DUPFFstruct* @DUPFFnew(i32 %tmp44)
  store %struct.DUPFFstruct* %call45, %struct.DUPFFstruct** %uf, align 8
  %tmp46 = load %struct.DUPFFstruct** %uf, align 8
  %coeffs47 = getelementptr inbounds %struct.DUPFFstruct* %tmp46, i32 0, i32 2
  %tmp48 = load i32** %coeffs47, align 8
  %arrayidx49 = getelementptr inbounds i32* %tmp48, i64 0
  store i32 1, i32* %arrayidx49
  %tmp50 = load %struct.DUPFFstruct** %uf, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %tmp50, i32 0, i32 1
  store i32 0, i32* %deg, align 4
  %tmp51 = load i32* %df, align 4
  %call52 = call %struct.DUPFFstruct* @DUPFFnew(i32 %tmp51)
  store %struct.DUPFFstruct* %call52, %struct.DUPFFstruct** %ug, align 8
  %tmp53 = load i32* %dg, align 4
  %call54 = call %struct.DUPFFstruct* @DUPFFnew(i32 %tmp53)
  store %struct.DUPFFstruct* %call54, %struct.DUPFFstruct** %vf, align 8
  %tmp55 = load i32* %df, align 4
  %call56 = call %struct.DUPFFstruct* @DUPFFnew(i32 %tmp55)
  store %struct.DUPFFstruct* %call56, %struct.DUPFFstruct** %vg, align 8
  %tmp57 = load %struct.DUPFFstruct** %vg, align 8
  %coeffs58 = getelementptr inbounds %struct.DUPFFstruct* %tmp57, i32 0, i32 2
  %tmp59 = load i32** %coeffs58, align 8
  %arrayidx60 = getelementptr inbounds i32* %tmp59, i64 0
  store i32 1, i32* %arrayidx60
  %tmp61 = load %struct.DUPFFstruct** %vg, align 8
  %deg62 = getelementptr inbounds %struct.DUPFFstruct* %tmp61, i32 0, i32 1
  store i32 0, i32* %deg62, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %if.end39
  %tmp63 = load %struct.DUPFFstruct** %v, align 8
  %call64 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp63)
  %cmp65 = icmp sgt i32 %call64, 0
  br i1 %cmp65, label %while.body, label %while.end122

while.body:                                       ; preds = %while.cond
  %tmp66 = load %struct.DUPFFstruct** %v, align 8
  %call67 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp66)
  store i32 %call67, i32* %dv, align 4
  %tmp68 = load i32* %dv, align 4
  %idxprom = sext i32 %tmp68 to i64
  %tmp69 = load %struct.DUPFFstruct** %v, align 8
  %coeffs70 = getelementptr inbounds %struct.DUPFFstruct* %tmp69, i32 0, i32 2
  %tmp71 = load i32** %coeffs70, align 8
  %arrayidx72 = getelementptr inbounds i32* %tmp71, i64 %idxprom
  %tmp73 = load i32* %arrayidx72
  %call74 = call i32 @FFmul(i32 1, i32 %tmp73)
  store i32 %call74, i32* %lcvrecip, align 4
  br label %while.cond75

while.cond75:                                     ; preds = %while.body80, %while.body
  %tmp76 = load %struct.DUPFFstruct** %u, align 8
  %call77 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp76)
  %tmp78 = load i32* %dv, align 4
  %cmp79 = icmp sge i32 %call77, %tmp78
  br i1 %cmp79, label %while.body80, label %while.end

while.body80:                                     ; preds = %while.cond75
  %tmp81 = load %struct.DUPFFstruct** %u, align 8
  %call82 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp81)
  store i32 %call82, i32* %du, align 4
  %tmp83 = load i32* %du, align 4
  %idxprom84 = sext i32 %tmp83 to i64
  %tmp85 = load %struct.DUPFFstruct** %u, align 8
  %coeffs86 = getelementptr inbounds %struct.DUPFFstruct* %tmp85, i32 0, i32 2
  %tmp87 = load i32** %coeffs86, align 8
  %arrayidx88 = getelementptr inbounds i32* %tmp87, i64 %idxprom84
  %tmp89 = load i32* %arrayidx88
  store i32 %tmp89, i32* %lcu, align 4
  %tmp90 = load i32* %lcu, align 4
  %tmp91 = load i32* %lcvrecip, align 4
  %call92 = call i32 @FFmul(i32 %tmp90, i32 %tmp91)
  store i32 %call92, i32* %q, align 4
  %tmp93 = load %struct.DUPFFstruct** %u, align 8
  %tmp94 = load %struct.DUPFFstruct** %v, align 8
  %tmp95 = load i32* %du, align 4
  %tmp96 = load i32* %dv, align 4
  %sub = sub nsw i32 %tmp95, %tmp96
  %tmp97 = load i32* %p, align 4
  %tmp98 = load i32* %q, align 4
  %sub99 = sub i32 %tmp97, %tmp98
  call void @DUPFFshift_add(%struct.DUPFFstruct* %tmp93, %struct.DUPFFstruct* %tmp94, i32 %sub, i32 %sub99)
  %tmp100 = load %struct.DUPFFstruct** %uf, align 8
  %tmp101 = load %struct.DUPFFstruct** %vf, align 8
  %tmp102 = load i32* %du, align 4
  %tmp103 = load i32* %dv, align 4
  %sub104 = sub nsw i32 %tmp102, %tmp103
  %tmp105 = load i32* %p, align 4
  %tmp106 = load i32* %q, align 4
  %sub107 = sub i32 %tmp105, %tmp106
  call void @DUPFFshift_add(%struct.DUPFFstruct* %tmp100, %struct.DUPFFstruct* %tmp101, i32 %sub104, i32 %sub107)
  %tmp108 = load %struct.DUPFFstruct** %ug, align 8
  %tmp109 = load %struct.DUPFFstruct** %vg, align 8
  %tmp110 = load i32* %du, align 4
  %tmp111 = load i32* %dv, align 4
  %sub112 = sub nsw i32 %tmp110, %tmp111
  %tmp113 = load i32* %p, align 4
  %tmp114 = load i32* %q, align 4
  %sub115 = sub i32 %tmp113, %tmp114
  call void @DUPFFshift_add(%struct.DUPFFstruct* %tmp108, %struct.DUPFFstruct* %tmp109, i32 %sub112, i32 %sub115)
  br label %while.cond75

while.end:                                        ; preds = %while.cond75
  %tmp116 = load %struct.DUPFFstruct** %u, align 8
  %tmp117 = load %struct.DUPFFstruct** %v, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %tmp116, %struct.DUPFFstruct* %tmp117)
  %tmp118 = load %struct.DUPFFstruct** %uf, align 8
  %tmp119 = load %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %tmp118, %struct.DUPFFstruct* %tmp119)
  %tmp120 = load %struct.DUPFFstruct** %ug, align 8
  %tmp121 = load %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %tmp120, %struct.DUPFFstruct* %tmp121)
  br label %while.cond

while.end122:                                     ; preds = %while.cond
  %tmp123 = load %struct.DUPFFstruct** %v, align 8
  %call124 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp123)
  %cmp125 = icmp eq i32 %call124, 0
  br i1 %cmp125, label %if.then126, label %if.end133

if.then126:                                       ; preds = %while.end122
  %tmp127 = load %struct.DUPFFstruct** %u, align 8
  %tmp128 = load %struct.DUPFFstruct** %v, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %tmp127, %struct.DUPFFstruct* %tmp128)
  %tmp129 = load %struct.DUPFFstruct** %uf, align 8
  %tmp130 = load %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %tmp129, %struct.DUPFFstruct* %tmp130)
  %tmp131 = load %struct.DUPFFstruct** %ug, align 8
  %tmp132 = load %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %tmp131, %struct.DUPFFstruct* %tmp132)
  br label %if.end133

if.end133:                                        ; preds = %if.then126, %while.end122
  %tmp134 = load %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %tmp134)
  %tmp135 = load %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %tmp135)
  %tmp136 = load %struct.DUPFFstruct** %v, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %tmp136)
  %tmp137 = load %struct.DUPFFstruct** %uf, align 8
  %tmp138 = load %struct.DUPFFstruct*** %fcofac.addr, align 8
  store %struct.DUPFFstruct* %tmp137, %struct.DUPFFstruct** %tmp138
  %tmp139 = load %struct.DUPFFstruct** %ug, align 8
  %tmp140 = load %struct.DUPFFstruct*** %gcofac.addr, align 8
  store %struct.DUPFFstruct* %tmp139, %struct.DUPFFstruct** %tmp140
  %tmp141 = load %struct.DUPFFstruct** %u, align 8
  store %struct.DUPFFstruct* %tmp141, %struct.DUPFFstruct** %retval
  br label %return

return:                                           ; preds = %if.end133, %if.then25, %if.then
  %0 = load %struct.DUPFFstruct** %retval
  ret %struct.DUPFFstruct* %0
}

declare i32 @printf(i8*, ...)

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca %struct.DUPFFstruct*, align 8
  %g = alloca %struct.DUPFFstruct*, align 8
  %cf = alloca %struct.DUPFFstruct*, align 8
  %cg = alloca %struct.DUPFFstruct*, align 8
  %h = alloca %struct.DUPFFstruct*, align 8
  store i32 0, i32* %retval
  %call = call %struct.DUPFFstruct* @DUPFFnew(i32 1)
  store %struct.DUPFFstruct* %call, %struct.DUPFFstruct** %f, align 8
  %tmp = load %struct.DUPFFstruct** %f, align 8
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %tmp, i32 0, i32 2
  %tmp1 = load i32** %coeffs, align 8
  %arrayidx = getelementptr inbounds i32* %tmp1, i64 1
  store i32 1, i32* %arrayidx
  %tmp2 = load %struct.DUPFFstruct** %f, align 8
  %deg = getelementptr inbounds %struct.DUPFFstruct* %tmp2, i32 0, i32 1
  store i32 1, i32* %deg, align 4
  %call3 = call %struct.DUPFFstruct* @DUPFFnew(i32 2)
  store %struct.DUPFFstruct* %call3, %struct.DUPFFstruct** %g, align 8
  %tmp4 = load %struct.DUPFFstruct** %g, align 8
  %coeffs5 = getelementptr inbounds %struct.DUPFFstruct* %tmp4, i32 0, i32 2
  %tmp6 = load i32** %coeffs5, align 8
  %arrayidx7 = getelementptr inbounds i32* %tmp6, i64 2
  store i32 1, i32* %arrayidx7
  %tmp8 = load %struct.DUPFFstruct** %g, align 8
  %deg9 = getelementptr inbounds %struct.DUPFFstruct* %tmp8, i32 0, i32 1
  store i32 2, i32* %deg9, align 4
  %tmp10 = load %struct.DUPFFstruct** %f, align 8
  %call11 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp10)
  %tmp12 = load %struct.DUPFFstruct** %g, align 8
  %call13 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %tmp12)
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str1, i32 0, i32 0), i32 %call11, i32 %call13)
  %tmp15 = load %struct.DUPFFstruct** %f, align 8
  %tmp16 = load %struct.DUPFFstruct** %g, align 8
  %call17 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %cf, %struct.DUPFFstruct** %cg, %struct.DUPFFstruct* %tmp15, %struct.DUPFFstruct* %tmp16)
  store %struct.DUPFFstruct* %call17, %struct.DUPFFstruct** %h, align 8
  ret i32 0
}
