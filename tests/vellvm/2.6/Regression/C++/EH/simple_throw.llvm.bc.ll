; ModuleID = 'simple_throw.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.__fundamental_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }

@_ZTIi = external constant %struct.__fundamental_type_info_pseudo ; <%struct.__fundamental_type_info_pseudo*> [#uses=1]
@.str = private constant [7 x i8] c"All ok\00", align 1 ; <[7 x i8]*> [#uses=1]

define i32 @main() {
entry:
  %0 = tail call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %1 = bitcast i8* %0 to i32*                     ; <i32*> [#uses=1]
  store i32 5, i32* %1, align 4
  invoke void @__cxa_throw(i8* %0, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), void (i8*)* null) noreturn
          to label %.noexc unwind label %invcont1

.noexc:                                           ; preds = %entry
  unreachable

invcont1:                                         ; preds = %entry
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select10 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %2 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0)) ; <i32> [#uses=0]
  tail call void @__cxa_end_catch()
  ret i32 0
}

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

declare i8* @__cxa_begin_catch(i8*) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare void @__cxa_end_catch()

declare i32 @__gxx_personality_v0(...)
