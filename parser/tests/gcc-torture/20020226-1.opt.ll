; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020226-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@uc = global i8 52, align 1
@us = global i16 4660, align 2
@ui = global i32 4660, align 4
@ul = global i64 305419896, align 8
@ull = global i64 81985529234382576, align 8
@shift1 = global i32 4, align 4
@shift2 = global i32 60, align 4

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

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp = load i8* @uc, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i32* @shift1, align 4
  %shr = lshr i32 %conv, %tmp1
  %sub = sub i32 8, %tmp1
  %shl = shl i32 %conv, %sub
  %or = or i32 %shl, %shr
  %cmp = icmp eq i32 %or, 835
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %shr92 = lshr i32 %conv, 4
  %shl12 = shl nuw nsw i32 %conv, 4
  %or13 = or i32 %shr92, %shl12
  %cmp14 = icmp eq i32 %or13, 835
  br i1 %cmp14, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end
  %tmp18 = load i16* @us, align 2
  %conv19 = zext i16 %tmp18 to i32
  %shr21 = lshr i32 %conv19, %tmp1
  %sub26 = sub i32 16, %tmp1
  %shl28 = shl i32 %conv19, %sub26
  %or29 = or i32 %shr21, %shl28
  %cmp30 = icmp eq i32 %or29, 19087651
  br i1 %cmp30, label %if.end33, label %if.then32

if.then32:                                        ; preds = %if.end17
  tail call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end17
  %shr364 = lshr i32 %conv19, 4
  %shl39 = shl nuw nsw i32 %conv19, 12
  %or40 = or i32 %shr364, %shl39
  %cmp41 = icmp eq i32 %or40, 19087651
  br i1 %cmp41, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end33
  tail call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end33
  %tmp45 = load i32* @ui, align 4
  %shr47 = lshr i32 %tmp45, %tmp1
  %sub51 = sub i32 32, %tmp1
  %shl53 = shl i32 %tmp45, %sub51
  %or54 = or i32 %shr47, %shl53
  %cmp55 = icmp eq i32 %or54, 1073742115
  br i1 %cmp55, label %if.end58, label %if.then57

if.then57:                                        ; preds = %if.end44
  tail call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end44
  %shr60 = lshr i32 %tmp45, 4
  %shl62 = shl i32 %tmp45, 28
  %or63 = or i32 %shr60, %shl62
  %cmp64 = icmp eq i32 %or63, 1073742115
  br i1 %cmp64, label %if.end67, label %if.then66

if.then66:                                        ; preds = %if.end58
  tail call void @abort() noreturn nounwind
  unreachable

if.end67:                                         ; preds = %if.end58
  %tmp68 = load i64* @ul, align 8
  %sh_prom70 = zext i32 %tmp1 to i64
  %shr71 = lshr i64 %tmp68, %sh_prom70
  %conv74 = sext i32 %tmp1 to i64
  %sub75 = sub i64 64, %conv74
  %shl76 = shl i64 %tmp68, %sub75
  %or77 = or i64 %shr71, %shl76
  %cmp78 = icmp eq i64 %or77, -9223372036835687065
  br i1 %cmp78, label %if.end81, label %if.then80

if.then80:                                        ; preds = %if.end67
  tail call void @abort() noreturn nounwind
  unreachable

if.end81:                                         ; preds = %if.end67
  %shr83 = lshr i64 %tmp68, 4
  %shl85 = shl i64 %tmp68, 60
  %or86 = or i64 %shr83, %shl85
  %cmp87 = icmp eq i64 %or86, -9223372036835687065
  br i1 %cmp87, label %if.end90, label %if.then89

if.then89:                                        ; preds = %if.end81
  tail call void @abort() noreturn nounwind
  unreachable

if.end90:                                         ; preds = %if.end81
  %tmp91 = load i64* @ull, align 8
  %shr94 = lshr i64 %tmp91, %sh_prom70
  %shl99 = shl i64 %tmp91, %sub75
  %or100 = or i64 %shr94, %shl99
  %cmp101 = icmp eq i64 %or100, 5124095577148911
  br i1 %cmp101, label %if.end104, label %if.then103

if.then103:                                       ; preds = %if.end90
  tail call void @abort() noreturn nounwind
  unreachable

if.end104:                                        ; preds = %if.end90
  %shr106 = lshr i64 %tmp91, 4
  %shl108 = shl i64 %tmp91, 60
  %or109 = or i64 %shr106, %shl108
  %cmp110 = icmp eq i64 %or109, 5124095577148911
  br i1 %cmp110, label %if.end113, label %if.then112

if.then112:                                       ; preds = %if.end104
  tail call void @abort() noreturn nounwind
  unreachable

if.end113:                                        ; preds = %if.end104
  %tmp115 = load i32* @shift2, align 4
  %sh_prom116 = zext i32 %tmp115 to i64
  %shr117 = lshr i64 %tmp91, %sh_prom116
  %conv120 = sext i32 %tmp115 to i64
  %sub121 = sub i64 64, %conv120
  %shl122 = shl i64 %tmp91, %sub121
  %or123 = or i64 %shl122, %shr117
  %cmp124 = icmp eq i64 %or123, 1311768467750121216
  br i1 %cmp124, label %if.end127, label %if.then126

if.then126:                                       ; preds = %if.end113
  tail call void @abort() noreturn nounwind
  unreachable

if.end127:                                        ; preds = %if.end113
  %shr129 = lshr i64 %tmp91, 60
  %shl131 = shl i64 %tmp91, 4
  %or132 = or i64 %shr129, %shl131
  %cmp133 = icmp eq i64 %or132, 1311768467750121216
  br i1 %cmp133, label %if.end136, label %if.then135

if.then135:                                       ; preds = %if.end127
  tail call void @abort() noreturn nounwind
  unreachable

if.end136:                                        ; preds = %if.end127
  %shl140 = shl i32 %conv, %tmp1
  %shr147 = lshr i32 %conv, %sub
  %or148 = or i32 %shr147, %shl140
  %cmp149 = icmp eq i32 %or148, 835
  br i1 %cmp149, label %if.end152, label %if.then151

if.then151:                                       ; preds = %if.end136
  tail call void @abort() noreturn nounwind
  unreachable

if.end152:                                        ; preds = %if.end136
  %or159 = or i32 %shl12, %shr92
  %cmp160 = icmp eq i32 %or159, 835
  br i1 %cmp160, label %if.end163, label %if.then162

if.then162:                                       ; preds = %if.end152
  tail call void @abort() noreturn nounwind
  unreachable

if.end163:                                        ; preds = %if.end152
  %shl167 = shl i32 %conv19, %tmp1
  %shr174 = lshr i32 %conv19, %sub26
  %or175 = or i32 %shl167, %shr174
  %cmp176 = icmp eq i32 %or175, 74561
  br i1 %cmp176, label %if.end179, label %if.then178

if.then178:                                       ; preds = %if.end163
  tail call void @abort() noreturn nounwind
  unreachable

if.end179:                                        ; preds = %if.end163
  %shl182 = shl nuw nsw i32 %conv19, 4
  %shr1859 = lshr i32 %conv19, 12
  %or186 = or i32 %shl182, %shr1859
  %cmp187 = icmp eq i32 %or186, 74561
  br i1 %cmp187, label %if.end190, label %if.then189

if.then189:                                       ; preds = %if.end179
  tail call void @abort() noreturn nounwind
  unreachable

if.end190:                                        ; preds = %if.end179
  %shl193 = shl i32 %tmp45, %tmp1
  %shr199 = lshr i32 %tmp45, %sub51
  %or200 = or i32 %shl193, %shr199
  %cmp201 = icmp eq i32 %or200, 74560
  br i1 %cmp201, label %if.end204, label %if.then203

if.then203:                                       ; preds = %if.end190
  tail call void @abort() noreturn nounwind
  unreachable

if.end204:                                        ; preds = %if.end190
  %shl206 = shl i32 %tmp45, 4
  %shr208 = lshr i32 %tmp45, 28
  %or209 = or i32 %shl206, %shr208
  %cmp210 = icmp eq i32 %or209, 74560
  br i1 %cmp210, label %if.end213, label %if.then212

if.then212:                                       ; preds = %if.end204
  tail call void @abort() noreturn nounwind
  unreachable

if.end213:                                        ; preds = %if.end204
  %shl217 = shl i64 %tmp68, %sh_prom70
  %shr222 = lshr i64 %tmp68, %sub75
  %or223 = or i64 %shl217, %shr222
  %cmp224 = icmp eq i64 %or223, 4886718336
  br i1 %cmp224, label %if.end227, label %if.then226

if.then226:                                       ; preds = %if.end213
  tail call void @abort() noreturn nounwind
  unreachable

if.end227:                                        ; preds = %if.end213
  %shl229 = shl i64 %tmp68, 4
  %shr231 = lshr i64 %tmp68, 60
  %or232 = or i64 %shl229, %shr231
  %cmp233 = icmp eq i64 %or232, 4886718336
  br i1 %cmp233, label %if.end236, label %if.then235

if.then235:                                       ; preds = %if.end227
  tail call void @abort() noreturn nounwind
  unreachable

if.end236:                                        ; preds = %if.end227
  %shl240 = shl i64 %tmp91, %sh_prom70
  %shr245 = lshr i64 %tmp91, %sub75
  %or246 = or i64 %shl240, %shr245
  %cmp247 = icmp eq i64 %or246, 1311768467750121216
  br i1 %cmp247, label %if.end250, label %if.then249

if.then249:                                       ; preds = %if.end236
  tail call void @abort() noreturn nounwind
  unreachable

if.end250:                                        ; preds = %if.end236
  %or255 = or i64 %shl131, %shr129
  %cmp256 = icmp eq i64 %or255, 1311768467750121216
  br i1 %cmp256, label %if.end259, label %if.then258

if.then258:                                       ; preds = %if.end250
  tail call void @abort() noreturn nounwind
  unreachable

if.end259:                                        ; preds = %if.end250
  %shl263 = shl i64 %tmp91, %sh_prom116
  %shr268 = lshr i64 %tmp91, %sub121
  %or269 = or i64 %shr268, %shl263
  %cmp270 = icmp eq i64 %or269, 5124095577148911
  br i1 %cmp270, label %if.end273, label %if.then272

if.then272:                                       ; preds = %if.end259
  tail call void @abort() noreturn nounwind
  unreachable

if.end273:                                        ; preds = %if.end259
  %or278 = or i64 %shl108, %shr106
  %cmp279 = icmp eq i64 %or278, 5124095577148911
  br i1 %cmp279, label %if.end282, label %if.then281

if.then281:                                       ; preds = %if.end273
  tail call void @abort() noreturn nounwind
  unreachable

if.end282:                                        ; preds = %if.end273
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
