; ModuleID = 'simple_rethrow.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.__fundamental_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }

@.str = private constant [13 x i8] c"Throwing int\00", align 1 ; <[13 x i8]*> [#uses=1]
@_ZTIi = external constant %struct.__fundamental_type_info_pseudo ; <%struct.__fundamental_type_info_pseudo*> [#uses=1]
@.str1 = private constant [32 x i8] c"Caught something, rethrowing...\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str2 = private constant [16 x i8] c"Caught int: %d\0A\00", align 1 ; <[16 x i8]*> [#uses=1]

declare i32 @puts(i8* nocapture) nounwind

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

declare i8* @__cxa_begin_catch(i8*) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @llvm.eh.typeid.for.i32(i8*) nounwind

declare void @__cxa_rethrow() noreturn

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

define i32 @main() {
entry:
  %0 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0)) ; <i32> [#uses=0]
  %1 = call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %2 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  store i32 16, i32* %2, align 4
  invoke void @__cxa_throw(i8* %1, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), void (i8*)* null) noreturn
          to label %.noexc.i unwind label %invcont1.i

.noexc.i:                                         ; preds = %entry
  unreachable

invcont1.i:                                       ; preds = %entry
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select10.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %3 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i) nounwind ; <i8*> [#uses=0]
  %4 = call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0)) ; <i32> [#uses=0]
  invoke void @__cxa_rethrow() noreturn
          to label %invcont2.i unwind label %lpad11.i

invcont2.i:                                       ; preds = %invcont1.i
  unreachable

invcont5.i:                                       ; preds = %lpad11.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr12.i)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %invcont5.i
  unreachable

lpad11.i:                                         ; preds = %invcont1.i
  %eh_ptr12.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select14.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr12.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont5.i unwind label %lpad15.i

lpad15.i:                                         ; preds = %lpad11.i
  %eh_ptr16.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select18.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr16.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

invcont1:                                         ; preds = %lpad
  %5 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=1]
  %6 = bitcast i8* %5 to i32*                     ; <i32*> [#uses=1]
  %7 = load i32* %6, align 4                      ; <i32> [#uses=2]
  %8 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str2, i32 0, i32 0), i32 %7) ; <i32> [#uses=0]
  %9 = add i32 %7, -16                            ; <i32> [#uses=1]
  tail call void @__cxa_end_catch()
  ret i32 %9

lpad:                                             ; preds = %invcont5.i
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=3]
  %eh_select10 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), i8* null) ; <i32> [#uses=1]
  %eh_typeid = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*)) ; <i32> [#uses=1]
  %10 = icmp eq i32 %eh_select10, %eh_typeid      ; <i1> [#uses=1]
  br i1 %10, label %invcont1, label %Unwind

Unwind:                                           ; preds = %lpad
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable
}

declare i32 @printf(i8* noalias nocapture, ...) nounwind
