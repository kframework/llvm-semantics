; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030914-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [16 x i32] }

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

define x86_fp80 @f(i32 %pa, %struct.s* nocapture byval align 8 %pb, x86_fp80 %pc) nounwind uwtable readonly {
entry:
  %arrayidx = getelementptr %struct.s* %pb, i64 0, i32 0, i64 0
  %tmp2 = load i32* %arrayidx, align 8
  %conv = sitofp i32 %tmp2 to x86_fp80
  %add = fadd x86_fp80 %conv, %pc
  %arrayidx.1 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 1
  %tmp2.1 = load i32* %arrayidx.1, align 4
  %conv.1 = sitofp i32 %tmp2.1 to x86_fp80
  %add.1 = fadd x86_fp80 %add, %conv.1
  %arrayidx.2 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 2
  %tmp2.2 = load i32* %arrayidx.2, align 8
  %conv.2 = sitofp i32 %tmp2.2 to x86_fp80
  %add.2 = fadd x86_fp80 %add.1, %conv.2
  %arrayidx.3 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 3
  %tmp2.3 = load i32* %arrayidx.3, align 4
  %conv.3 = sitofp i32 %tmp2.3 to x86_fp80
  %add.3 = fadd x86_fp80 %add.2, %conv.3
  %arrayidx.4 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 4
  %tmp2.4 = load i32* %arrayidx.4, align 8
  %conv.4 = sitofp i32 %tmp2.4 to x86_fp80
  %add.4 = fadd x86_fp80 %add.3, %conv.4
  %arrayidx.5 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 5
  %tmp2.5 = load i32* %arrayidx.5, align 4
  %conv.5 = sitofp i32 %tmp2.5 to x86_fp80
  %add.5 = fadd x86_fp80 %add.4, %conv.5
  %arrayidx.6 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 6
  %tmp2.6 = load i32* %arrayidx.6, align 8
  %conv.6 = sitofp i32 %tmp2.6 to x86_fp80
  %add.6 = fadd x86_fp80 %add.5, %conv.6
  %arrayidx.7 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 7
  %tmp2.7 = load i32* %arrayidx.7, align 4
  %conv.7 = sitofp i32 %tmp2.7 to x86_fp80
  %add.7 = fadd x86_fp80 %add.6, %conv.7
  %arrayidx.8 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 8
  %tmp2.8 = load i32* %arrayidx.8, align 8
  %conv.8 = sitofp i32 %tmp2.8 to x86_fp80
  %add.8 = fadd x86_fp80 %add.7, %conv.8
  %arrayidx.9 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 9
  %tmp2.9 = load i32* %arrayidx.9, align 4
  %conv.9 = sitofp i32 %tmp2.9 to x86_fp80
  %add.9 = fadd x86_fp80 %add.8, %conv.9
  %arrayidx.10 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 10
  %tmp2.10 = load i32* %arrayidx.10, align 8
  %conv.10 = sitofp i32 %tmp2.10 to x86_fp80
  %add.10 = fadd x86_fp80 %add.9, %conv.10
  %arrayidx.11 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 11
  %tmp2.11 = load i32* %arrayidx.11, align 4
  %conv.11 = sitofp i32 %tmp2.11 to x86_fp80
  %add.11 = fadd x86_fp80 %add.10, %conv.11
  %arrayidx.12 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 12
  %tmp2.12 = load i32* %arrayidx.12, align 8
  %conv.12 = sitofp i32 %tmp2.12 to x86_fp80
  %add.12 = fadd x86_fp80 %add.11, %conv.12
  %arrayidx.13 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 13
  %tmp2.13 = load i32* %arrayidx.13, align 4
  %conv.13 = sitofp i32 %tmp2.13 to x86_fp80
  %add.13 = fadd x86_fp80 %add.12, %conv.13
  %arrayidx.14 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 14
  %tmp2.14 = load i32* %arrayidx.14, align 8
  %conv.14 = sitofp i32 %tmp2.14 to x86_fp80
  %add.14 = fadd x86_fp80 %add.13, %conv.14
  %arrayidx.15 = getelementptr %struct.s* %pb, i64 0, i32 0, i64 15
  %tmp2.15 = load i32* %arrayidx.15, align 4
  %conv.15 = sitofp i32 %tmp2.15 to x86_fp80
  %add.15 = fadd x86_fp80 %add.14, %conv.15
  ret x86_fp80 %add.15
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
