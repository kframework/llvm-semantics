; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020508-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uc = global i8 52, align 1
@us = global i16 -3532, align 2
@ui = global i32 62004, align 4
@ul = global i64 4063516280, align 8
@ull = global i64 1090791845765373680, align 8
@shift1 = global i32 4, align 4
@shift2 = global i32 60, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i8* @uc, align 1, !tbaa !0
  %conv = zext i8 %0 to i32
  %1 = load i32* @shift1, align 4, !tbaa !2
  %shr = lshr i32 %conv, %1
  %conv2 = sext i32 %1 to i64
  %sub = sub i32 8, %1
  %shl = shl i32 %conv, %sub
  %or = or i32 %shl, %shr
  %cmp = icmp eq i32 %or, 835
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %shr5212 = lshr i32 %conv, 4
  %shl7 = shl nuw nsw i32 %conv, 4
  %or8 = or i32 %shr5212, %shl7
  %cmp9 = icmp eq i32 %or8, 835
  br i1 %cmp9, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end
  %2 = load i16* @us, align 2, !tbaa !3
  %conv13 = zext i16 %2 to i32
  %shr14 = lshr i32 %conv13, %1
  %sub17 = sub i32 16, %1
  %shl19 = shl i32 %conv13, %sub17
  %or20 = or i32 %shr14, %shl19
  %cmp21 = icmp eq i32 %or20, 253972259
  br i1 %cmp21, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end12
  %shr26213 = lshr i32 %conv13, 4
  %shl28 = shl nuw nsw i32 %conv13, 12
  %or29 = or i32 %shr26213, %shl28
  %cmp30 = icmp eq i32 %or29, 253972259
  br i1 %cmp30, label %if.end33, label %if.then32

if.then32:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end24
  %3 = load i32* @ui, align 4, !tbaa !2
  %shr34 = lshr i32 %3, %1
  %sub36 = sub i32 32, %1
  %shl38 = shl i32 %3, %sub36
  %or39 = or i32 %shr34, %shl38
  %cmp40 = icmp eq i32 %or39, 1073745699
  br i1 %cmp40, label %if.end43, label %if.then42

if.then42:                                        ; preds = %if.end33
  tail call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.end33
  %shr44 = lshr i32 %3, 4
  %shl45 = shl i32 %3, 28
  %or46 = or i32 %shr44, %shl45
  %cmp47 = icmp eq i32 %or46, 1073745699
  br i1 %cmp47, label %if.end50, label %if.then49

if.then49:                                        ; preds = %if.end43
  tail call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.end43
  %4 = load i64* @ul, align 8, !tbaa !4
  %sh_prom51 = zext i32 %1 to i64
  %shr52 = lshr i64 %4, %sh_prom51
  %sub54 = sub i64 64, %conv2
  %shl55 = shl i64 %4, %sub54
  %or56 = or i64 %shr52, %shl55
  %cmp57 = icmp eq i64 %or56, -9223372036600806041
  br i1 %cmp57, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end50
  tail call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end50
  %shr61 = lshr i64 %4, 4
  %shl62 = shl i64 %4, 60
  %or63 = or i64 %shr61, %shl62
  %cmp64 = icmp eq i64 %or63, -9223372036600806041
  br i1 %cmp64, label %if.end67, label %if.then66

if.then66:                                        ; preds = %if.end60
  tail call void @abort() noreturn nounwind
  unreachable

if.end67:                                         ; preds = %if.end60
  %5 = load i64* @ull, align 8, !tbaa !5
  %shr69 = lshr i64 %5, %sh_prom51
  %shl72 = shl i64 %5, %sub54
  %or73 = or i64 %shr69, %shl72
  %cmp74 = icmp eq i64 %or73, 68174490360335855
  br i1 %cmp74, label %if.end77, label %if.then76

if.then76:                                        ; preds = %if.end67
  tail call void @abort() noreturn nounwind
  unreachable

if.end77:                                         ; preds = %if.end67
  %shr78 = lshr i64 %5, 4
  %shl79 = shl i64 %5, 60
  %or80 = or i64 %shr78, %shl79
  %cmp81 = icmp eq i64 %or80, 68174490360335855
  br i1 %cmp81, label %if.end84, label %if.then83

if.then83:                                        ; preds = %if.end77
  tail call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end77
  %6 = load i32* @shift2, align 4, !tbaa !2
  %sh_prom85 = zext i32 %6 to i64
  %shr86 = lshr i64 %5, %sh_prom85
  %conv87 = sext i32 %6 to i64
  %sub88 = sub i64 64, %conv87
  %shl89 = shl i64 %5, %sub88
  %or90 = or i64 %shl89, %shr86
  %cmp91 = icmp eq i64 %or90, -994074541463572736
  br i1 %cmp91, label %if.end94, label %if.then93

if.then93:                                        ; preds = %if.end84
  tail call void @abort() noreturn nounwind
  unreachable

if.end94:                                         ; preds = %if.end84
  %shr95 = lshr i64 %5, 60
  %shl96 = shl i64 %5, 4
  %or97 = or i64 %shr95, %shl96
  %cmp98 = icmp eq i64 %or97, -994074541463572736
  br i1 %cmp98, label %if.end101, label %if.then100

if.then100:                                       ; preds = %if.end94
  tail call void @abort() noreturn nounwind
  unreachable

if.end101:                                        ; preds = %if.end94
  %shl103 = shl i32 %conv, %1
  %shr108 = lshr i32 %conv, %sub
  %or109 = or i32 %shr108, %shl103
  %cmp110 = icmp eq i32 %or109, 835
  br i1 %cmp110, label %if.end122, label %if.then112

if.then112:                                       ; preds = %if.end101
  tail call void @abort() noreturn nounwind
  unreachable

if.end122:                                        ; preds = %if.end101
  %shl124 = shl i32 %conv13, %1
  %shr129 = lshr i32 %conv13, %sub17
  %or130 = or i32 %shl124, %shr129
  %cmp131 = icmp eq i32 %or130, 992079
  br i1 %cmp131, label %if.end134, label %if.then133

if.then133:                                       ; preds = %if.end122
  tail call void @abort() noreturn nounwind
  unreachable

if.end134:                                        ; preds = %if.end122
  %shl136 = shl nuw nsw i32 %conv13, 4
  %shr138214 = lshr i32 %conv13, 12
  %or139 = or i32 %shl136, %shr138214
  %cmp140 = icmp eq i32 %or139, 992079
  br i1 %cmp140, label %if.end143, label %if.then142

if.then142:                                       ; preds = %if.end134
  tail call void @abort() noreturn nounwind
  unreachable

if.end143:                                        ; preds = %if.end134
  %shl144 = shl i32 %3, %1
  %shr148 = lshr i32 %3, %sub36
  %or149 = or i32 %shl144, %shr148
  %cmp150 = icmp eq i32 %or149, 992064
  br i1 %cmp150, label %if.end153, label %if.then152

if.then152:                                       ; preds = %if.end143
  tail call void @abort() noreturn nounwind
  unreachable

if.end153:                                        ; preds = %if.end143
  %shl154 = shl i32 %3, 4
  %shr155 = lshr i32 %3, 28
  %or156 = or i32 %shl154, %shr155
  %cmp157 = icmp eq i32 %or156, 992064
  br i1 %cmp157, label %if.end160, label %if.then159

if.then159:                                       ; preds = %if.end153
  tail call void @abort() noreturn nounwind
  unreachable

if.end160:                                        ; preds = %if.end153
  %shl162 = shl i64 %4, %sh_prom51
  %shr165 = lshr i64 %4, %sub54
  %or166 = or i64 %shl162, %shr165
  %cmp167 = icmp eq i64 %or166, 65016260480
  br i1 %cmp167, label %if.end170, label %if.then169

if.then169:                                       ; preds = %if.end160
  tail call void @abort() noreturn nounwind
  unreachable

if.end170:                                        ; preds = %if.end160
  %shl171 = shl i64 %4, 4
  %shr172 = lshr i64 %4, 60
  %or173 = or i64 %shl171, %shr172
  %cmp174 = icmp eq i64 %or173, 65016260480
  br i1 %cmp174, label %if.end177, label %if.then176

if.then176:                                       ; preds = %if.end170
  tail call void @abort() noreturn nounwind
  unreachable

if.end177:                                        ; preds = %if.end170
  %shl179 = shl i64 %5, %sh_prom51
  %shr182 = lshr i64 %5, %sub54
  %or183 = or i64 %shl179, %shr182
  %cmp184 = icmp eq i64 %or183, -994074541463572736
  br i1 %cmp184, label %if.end194, label %if.then186

if.then186:                                       ; preds = %if.end177
  tail call void @abort() noreturn nounwind
  unreachable

if.end194:                                        ; preds = %if.end177
  %shl196 = shl i64 %5, %sh_prom85
  %shr199 = lshr i64 %5, %sub88
  %or200 = or i64 %shr199, %shl196
  %cmp201 = icmp eq i64 %or200, 68174490360335855
  br i1 %cmp201, label %if.end211, label %if.then203

if.then203:                                       ; preds = %if.end194
  tail call void @abort() noreturn nounwind
  unreachable

if.end211:                                        ; preds = %if.end194
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"short", metadata !0}
!4 = metadata !{metadata !"long", metadata !0}
!5 = metadata !{metadata !"long long", metadata !0}
