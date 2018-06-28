#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME:
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP C_isnull(SEXP);
extern SEXP R_SWIG_debug_getCallbackFunctionData();
extern SEXP R_swig_librdf_copyright_string_get(SEXP);
extern SEXP R_swig_librdf_digest_final(SEXP);
extern SEXP R_swig_librdf_digest_init(SEXP);
extern SEXP R_swig_librdf_digest_to_string(SEXP);
extern SEXP R_swig_librdf_digest_update(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_digest_update_string(SEXP, SEXP);
extern SEXP R_swig_librdf_free_digest(SEXP);
extern SEXP R_swig_librdf_free_hash(SEXP);
extern SEXP R_swig_librdf_free_iterator(SEXP);
extern SEXP R_swig_librdf_free_model(SEXP);
extern SEXP R_swig_librdf_free_node(SEXP);
extern SEXP R_swig_librdf_free_parser(SEXP);
extern SEXP R_swig_librdf_free_query(SEXP);
extern SEXP R_swig_librdf_free_query_results(SEXP);
extern SEXP R_swig_librdf_free_serializer(SEXP);
extern SEXP R_swig_librdf_free_statement(SEXP);
extern SEXP R_swig_librdf_free_storage(SEXP);
extern SEXP R_swig_librdf_free_stream(SEXP);
extern SEXP R_swig_librdf_free_uri(SEXP);
extern SEXP R_swig_librdf_free_world(SEXP);
extern SEXP R_swig_librdf_hash_to_string(SEXP, SEXP);
extern SEXP R_swig_librdf_internal_test_error(SEXP);
extern SEXP R_swig_librdf_internal_test_warning(SEXP);
extern SEXP R_swig_librdf_iterator_end(SEXP, SEXP);
extern SEXP R_swig_librdf_iterator_get_context(SEXP);
extern SEXP R_swig_librdf_iterator_get_object(SEXP);
extern SEXP R_swig_librdf_iterator_next(SEXP, SEXP);
extern SEXP R_swig_librdf_log_message_code(SEXP, SEXP);
extern SEXP R_swig_librdf_log_message_facility(SEXP, SEXP);
extern SEXP R_swig_librdf_log_message_level(SEXP, SEXP);
extern SEXP R_swig_librdf_log_message_locator(SEXP);
extern SEXP R_swig_librdf_log_message_message(SEXP);
extern SEXP R_swig_librdf_model_add(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_add_statement(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_add_statements(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_add_string_literal_statement(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_add_typed_literal_statement(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_as_stream(SEXP);
extern SEXP R_swig_librdf_model_contains_context(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_contains_statement(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_context_add_statement(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_context_add_statements(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_context_as_stream(SEXP, SEXP);
extern SEXP R_swig_librdf_model_context_remove_statement(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_context_remove_statements(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_find_statements(SEXP, SEXP);
extern SEXP R_swig_librdf_model_find_statements_in_context(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_arc(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_arcs(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_arcs_in(SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_arcs_out(SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_contexts(SEXP);
extern SEXP R_swig_librdf_model_get_feature(SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_source(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_sources(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_target(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_get_targets(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_has_arc_in(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_has_arc_out(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_load(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_query_execute(SEXP, SEXP);
extern SEXP R_swig_librdf_model_remove_statement(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_set_feature(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_size(SEXP, SEXP);
extern SEXP R_swig_librdf_model_sync(SEXP);
extern SEXP R_swig_librdf_model_to_string(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_model_transaction_commit(SEXP, SEXP);
extern SEXP R_swig_librdf_model_transaction_rollback(SEXP, SEXP);
extern SEXP R_swig_librdf_model_transaction_start(SEXP, SEXP);
extern SEXP R_swig_librdf_new_digest(SEXP, SEXP);
extern SEXP R_swig_librdf_new_hash(SEXP, SEXP);
extern SEXP R_swig_librdf_new_hash_from_array_of_strings(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_hash_from_string(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_model(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_model_from_model(SEXP);
extern SEXP R_swig_librdf_new_model_with_options(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_node(SEXP);
extern SEXP R_swig_librdf_new_node_from_blank_identifier(SEXP, SEXP);
extern SEXP R_swig_librdf_new_node_from_literal(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_node_from_node(SEXP);
extern SEXP R_swig_librdf_new_node_from_normalised_uri_string(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_node_from_typed_literal(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_node_from_uri(SEXP, SEXP);
extern SEXP R_swig_librdf_new_node_from_uri_local_name(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_node_from_uri_string(SEXP, SEXP);
extern SEXP R_swig_librdf_new_parser(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_query(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_query_from_query(SEXP);
extern SEXP R_swig_librdf_new_serializer(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_statement(SEXP);
extern SEXP R_swig_librdf_new_statement_from_nodes(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_statement_from_statement(SEXP);
extern SEXP R_swig_librdf_new_storage(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_new_storage_from_storage(SEXP);
extern SEXP R_swig_librdf_new_uri(SEXP, SEXP);
extern SEXP R_swig_librdf_new_uri_from_filename(SEXP, SEXP);
extern SEXP R_swig_librdf_new_uri_from_uri(SEXP);
extern SEXP R_swig_librdf_new_world();
extern SEXP R_swig_librdf_node_equals(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_node_get_blank_identifier(SEXP);
extern SEXP R_swig_librdf_node_get_li_ordinal(SEXP, SEXP);
extern SEXP R_swig_librdf_node_get_literal_value(SEXP);
extern SEXP R_swig_librdf_node_get_literal_value_as_latin1(SEXP);
extern SEXP R_swig_librdf_node_get_literal_value_datatype_uri(SEXP);
extern SEXP R_swig_librdf_node_get_literal_value_is_wf_xml(SEXP, SEXP);
extern SEXP R_swig_librdf_node_get_literal_value_language(SEXP);
extern SEXP R_swig_librdf_node_get_type(SEXP, SEXP);
extern SEXP R_swig_librdf_node_get_uri(SEXP);
extern SEXP R_swig_librdf_node_is_blank(SEXP, SEXP);
extern SEXP R_swig_librdf_node_is_literal(SEXP, SEXP);
extern SEXP R_swig_librdf_node_is_resource(SEXP, SEXP);
extern SEXP R_swig_librdf_node_to_string(SEXP);
extern SEXP R_swig_librdf_parser_check_name(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_get_accept_header(SEXP);
extern SEXP R_swig_librdf_parser_get_feature(SEXP, SEXP);
extern SEXP R_swig_librdf_parser_get_namespaces_seen_count(SEXP, SEXP);
extern SEXP R_swig_librdf_parser_get_namespaces_seen_prefix(SEXP, SEXP);
extern SEXP R_swig_librdf_parser_get_namespaces_seen_uri(SEXP, SEXP);
extern SEXP R_swig_librdf_parser_guess_name(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_guess_name2(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_parse_as_stream(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_parse_counted_string_as_stream(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_parse_counted_string_into_model(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_parse_into_model(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_parse_string_as_stream(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_parse_string_into_model(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_parser_set_feature(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_query_execute(SEXP, SEXP);
extern SEXP R_swig_librdf_query_get_limit(SEXP, SEXP);
extern SEXP R_swig_librdf_query_get_offset(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_as_stream(SEXP);
extern SEXP R_swig_librdf_query_results_finished(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_get_binding_name(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_get_binding_value(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_get_binding_value_by_name(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_get_bindings_count(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_get_boolean(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_get_count(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_is_bindings(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_is_boolean(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_is_graph(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_is_syntax(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_next(SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_to_file(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_to_file2(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_to_string(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_query_results_to_string2(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_query_set_limit(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_query_set_offset(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_check_name(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_get_feature(SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_serialize_model_to_file(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_serialize_model_to_string(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_serialize_stream_to_file(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_serialize_stream_to_string(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_set_feature(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_serializer_set_namespace(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_short_copyright_string_get(SEXP);
extern SEXP R_swig_librdf_statement_equals(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_statement_get_object(SEXP);
extern SEXP R_swig_librdf_statement_get_predicate(SEXP);
extern SEXP R_swig_librdf_statement_get_subject(SEXP);
extern SEXP R_swig_librdf_statement_is_complete(SEXP, SEXP);
extern SEXP R_swig_librdf_statement_match(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_statement_set_object(SEXP, SEXP);
extern SEXP R_swig_librdf_statement_set_predicate(SEXP, SEXP);
extern SEXP R_swig_librdf_statement_set_subject(SEXP, SEXP);
extern SEXP R_swig_librdf_statement_to_string(SEXP);
extern SEXP R_swig_librdf_stream_end(SEXP, SEXP);
extern SEXP R_swig_librdf_stream_get_context(SEXP);
extern SEXP R_swig_librdf_stream_get_object(SEXP);
extern SEXP R_swig_librdf_stream_next(SEXP, SEXP);
extern SEXP R_swig_librdf_uri_compare(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_uri_equals(SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_uri_to_string(SEXP);
extern SEXP R_swig_librdf_version_decimal_get(SEXP);
extern SEXP R_swig_librdf_version_major_get(SEXP);
extern SEXP R_swig_librdf_version_minor_get(SEXP);
extern SEXP R_swig_librdf_version_release_get(SEXP);
extern SEXP R_swig_librdf_version_string_get(SEXP);
extern SEXP R_swig_librdf_world_get_feature(SEXP, SEXP);
extern SEXP R_swig_librdf_world_open(SEXP);
extern SEXP R_swig_librdf_world_set_feature(SEXP, SEXP, SEXP, SEXP);
extern SEXP R_swig_librdf_world_set_logger(SEXP, SEXP, SEXP);
extern SEXP R_SWIG_R_pushCallbackFunctionData(SEXP, SEXP);
extern SEXP R_swig_raptor_locator_byte(SEXP, SEXP);
extern SEXP R_swig_raptor_locator_column(SEXP, SEXP);
extern SEXP R_swig_raptor_locator_file(SEXP);
extern SEXP R_swig_raptor_locator_line(SEXP, SEXP);
extern SEXP R_swig_raptor_locator_uri(SEXP);
extern SEXP R_swig_raptor_version_decimal_get(SEXP);
extern SEXP R_swig_raptor_version_major_get(SEXP);
extern SEXP R_swig_raptor_version_minor_get(SEXP);
extern SEXP R_swig_raptor_version_release_get(SEXP);
extern SEXP R_swig_raptor_version_string_get(SEXP);
extern SEXP R_swig_rasqal_version_decimal_get(SEXP);
extern SEXP R_swig_rasqal_version_major_get(SEXP);
extern SEXP R_swig_rasqal_version_minor_get(SEXP);
extern SEXP R_swig_rasqal_version_release_get(SEXP);
extern SEXP R_swig_rasqal_version_string_get(SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"C_isnull",                                              (DL_FUNC) &C_isnull,                                              1},
    {"R_SWIG_debug_getCallbackFunctionData",                  (DL_FUNC) &R_SWIG_debug_getCallbackFunctionData,                  0},
    {"R_swig_librdf_copyright_string_get",                    (DL_FUNC) &R_swig_librdf_copyright_string_get,                    1},
    {"R_swig_librdf_digest_final",                            (DL_FUNC) &R_swig_librdf_digest_final,                            1},
    {"R_swig_librdf_digest_init",                             (DL_FUNC) &R_swig_librdf_digest_init,                             1},
    {"R_swig_librdf_digest_to_string",                        (DL_FUNC) &R_swig_librdf_digest_to_string,                        1},
    {"R_swig_librdf_digest_update",                           (DL_FUNC) &R_swig_librdf_digest_update,                           3},
    {"R_swig_librdf_digest_update_string",                    (DL_FUNC) &R_swig_librdf_digest_update_string,                    2},
    {"R_swig_librdf_free_digest",                             (DL_FUNC) &R_swig_librdf_free_digest,                             1},
    {"R_swig_librdf_free_hash",                               (DL_FUNC) &R_swig_librdf_free_hash,                               1},
    {"R_swig_librdf_free_iterator",                           (DL_FUNC) &R_swig_librdf_free_iterator,                           1},
    {"R_swig_librdf_free_model",                              (DL_FUNC) &R_swig_librdf_free_model,                              1},
    {"R_swig_librdf_free_node",                               (DL_FUNC) &R_swig_librdf_free_node,                               1},
    {"R_swig_librdf_free_parser",                             (DL_FUNC) &R_swig_librdf_free_parser,                             1},
    {"R_swig_librdf_free_query",                              (DL_FUNC) &R_swig_librdf_free_query,                              1},
    {"R_swig_librdf_free_query_results",                      (DL_FUNC) &R_swig_librdf_free_query_results,                      1},
    {"R_swig_librdf_free_serializer",                         (DL_FUNC) &R_swig_librdf_free_serializer,                         1},
    {"R_swig_librdf_free_statement",                          (DL_FUNC) &R_swig_librdf_free_statement,                          1},
    {"R_swig_librdf_free_storage",                            (DL_FUNC) &R_swig_librdf_free_storage,                            1},
    {"R_swig_librdf_free_stream",                             (DL_FUNC) &R_swig_librdf_free_stream,                             1},
    {"R_swig_librdf_free_uri",                                (DL_FUNC) &R_swig_librdf_free_uri,                                1},
    {"R_swig_librdf_free_world",                              (DL_FUNC) &R_swig_librdf_free_world,                              1},
    {"R_swig_librdf_hash_to_string",                          (DL_FUNC) &R_swig_librdf_hash_to_string,                          2},
    {"R_swig_librdf_internal_test_error",                     (DL_FUNC) &R_swig_librdf_internal_test_error,                     1},
    {"R_swig_librdf_internal_test_warning",                   (DL_FUNC) &R_swig_librdf_internal_test_warning,                   1},
    {"R_swig_librdf_iterator_end",                            (DL_FUNC) &R_swig_librdf_iterator_end,                            2},
    {"R_swig_librdf_iterator_get_context",                    (DL_FUNC) &R_swig_librdf_iterator_get_context,                    1},
    {"R_swig_librdf_iterator_get_object",                     (DL_FUNC) &R_swig_librdf_iterator_get_object,                     1},
    {"R_swig_librdf_iterator_next",                           (DL_FUNC) &R_swig_librdf_iterator_next,                           2},
    {"R_swig_librdf_log_message_code",                        (DL_FUNC) &R_swig_librdf_log_message_code,                        2},
    {"R_swig_librdf_log_message_facility",                    (DL_FUNC) &R_swig_librdf_log_message_facility,                    2},
    {"R_swig_librdf_log_message_level",                       (DL_FUNC) &R_swig_librdf_log_message_level,                       2},
    {"R_swig_librdf_log_message_locator",                     (DL_FUNC) &R_swig_librdf_log_message_locator,                     1},
    {"R_swig_librdf_log_message_message",                     (DL_FUNC) &R_swig_librdf_log_message_message,                     1},
    {"R_swig_librdf_model_add",                               (DL_FUNC) &R_swig_librdf_model_add,                               5},
    {"R_swig_librdf_model_add_statement",                     (DL_FUNC) &R_swig_librdf_model_add_statement,                     3},
    {"R_swig_librdf_model_add_statements",                    (DL_FUNC) &R_swig_librdf_model_add_statements,                    3},
    {"R_swig_librdf_model_add_string_literal_statement",      (DL_FUNC) &R_swig_librdf_model_add_string_literal_statement,      7},
    {"R_swig_librdf_model_add_typed_literal_statement",       (DL_FUNC) &R_swig_librdf_model_add_typed_literal_statement,       7},
    {"R_swig_librdf_model_as_stream",                         (DL_FUNC) &R_swig_librdf_model_as_stream,                         1},
    {"R_swig_librdf_model_contains_context",                  (DL_FUNC) &R_swig_librdf_model_contains_context,                  3},
    {"R_swig_librdf_model_contains_statement",                (DL_FUNC) &R_swig_librdf_model_contains_statement,                3},
    {"R_swig_librdf_model_context_add_statement",             (DL_FUNC) &R_swig_librdf_model_context_add_statement,             4},
    {"R_swig_librdf_model_context_add_statements",            (DL_FUNC) &R_swig_librdf_model_context_add_statements,            4},
    {"R_swig_librdf_model_context_as_stream",                 (DL_FUNC) &R_swig_librdf_model_context_as_stream,                 2},
    {"R_swig_librdf_model_context_remove_statement",          (DL_FUNC) &R_swig_librdf_model_context_remove_statement,          4},
    {"R_swig_librdf_model_context_remove_statements",         (DL_FUNC) &R_swig_librdf_model_context_remove_statements,         3},
    {"R_swig_librdf_model_find_statements",                   (DL_FUNC) &R_swig_librdf_model_find_statements,                   2},
    {"R_swig_librdf_model_find_statements_in_context",        (DL_FUNC) &R_swig_librdf_model_find_statements_in_context,        3},
    {"R_swig_librdf_model_get_arc",                           (DL_FUNC) &R_swig_librdf_model_get_arc,                           3},
    {"R_swig_librdf_model_get_arcs",                          (DL_FUNC) &R_swig_librdf_model_get_arcs,                          3},
    {"R_swig_librdf_model_get_arcs_in",                       (DL_FUNC) &R_swig_librdf_model_get_arcs_in,                       2},
    {"R_swig_librdf_model_get_arcs_out",                      (DL_FUNC) &R_swig_librdf_model_get_arcs_out,                      2},
    {"R_swig_librdf_model_get_contexts",                      (DL_FUNC) &R_swig_librdf_model_get_contexts,                      1},
    {"R_swig_librdf_model_get_feature",                       (DL_FUNC) &R_swig_librdf_model_get_feature,                       2},
    {"R_swig_librdf_model_get_source",                        (DL_FUNC) &R_swig_librdf_model_get_source,                        3},
    {"R_swig_librdf_model_get_sources",                       (DL_FUNC) &R_swig_librdf_model_get_sources,                       3},
    {"R_swig_librdf_model_get_target",                        (DL_FUNC) &R_swig_librdf_model_get_target,                        3},
    {"R_swig_librdf_model_get_targets",                       (DL_FUNC) &R_swig_librdf_model_get_targets,                       3},
    {"R_swig_librdf_model_has_arc_in",                        (DL_FUNC) &R_swig_librdf_model_has_arc_in,                        4},
    {"R_swig_librdf_model_has_arc_out",                       (DL_FUNC) &R_swig_librdf_model_has_arc_out,                       4},
    {"R_swig_librdf_model_load",                              (DL_FUNC) &R_swig_librdf_model_load,                              6},
    {"R_swig_librdf_model_query_execute",                     (DL_FUNC) &R_swig_librdf_model_query_execute,                     2},
    {"R_swig_librdf_model_remove_statement",                  (DL_FUNC) &R_swig_librdf_model_remove_statement,                  3},
    {"R_swig_librdf_model_set_feature",                       (DL_FUNC) &R_swig_librdf_model_set_feature,                       4},
    {"R_swig_librdf_model_size",                              (DL_FUNC) &R_swig_librdf_model_size,                              2},
    {"R_swig_librdf_model_sync",                              (DL_FUNC) &R_swig_librdf_model_sync,                              1},
    {"R_swig_librdf_model_to_string",                         (DL_FUNC) &R_swig_librdf_model_to_string,                         5},
    {"R_swig_librdf_model_transaction_commit",                (DL_FUNC) &R_swig_librdf_model_transaction_commit,                2},
    {"R_swig_librdf_model_transaction_rollback",              (DL_FUNC) &R_swig_librdf_model_transaction_rollback,              2},
    {"R_swig_librdf_model_transaction_start",                 (DL_FUNC) &R_swig_librdf_model_transaction_start,                 2},
    {"R_swig_librdf_new_digest",                              (DL_FUNC) &R_swig_librdf_new_digest,                              2},
    {"R_swig_librdf_new_hash",                                (DL_FUNC) &R_swig_librdf_new_hash,                                2},
    {"R_swig_librdf_new_hash_from_array_of_strings",          (DL_FUNC) &R_swig_librdf_new_hash_from_array_of_strings,          3},
    {"R_swig_librdf_new_hash_from_string",                    (DL_FUNC) &R_swig_librdf_new_hash_from_string,                    3},
    {"R_swig_librdf_new_model",                               (DL_FUNC) &R_swig_librdf_new_model,                               3},
    {"R_swig_librdf_new_model_from_model",                    (DL_FUNC) &R_swig_librdf_new_model_from_model,                    1},
    {"R_swig_librdf_new_model_with_options",                  (DL_FUNC) &R_swig_librdf_new_model_with_options,                  3},
    {"R_swig_librdf_new_node",                                (DL_FUNC) &R_swig_librdf_new_node,                                1},
    {"R_swig_librdf_new_node_from_blank_identifier",          (DL_FUNC) &R_swig_librdf_new_node_from_blank_identifier,          2},
    {"R_swig_librdf_new_node_from_literal",                   (DL_FUNC) &R_swig_librdf_new_node_from_literal,                   4},
    {"R_swig_librdf_new_node_from_node",                      (DL_FUNC) &R_swig_librdf_new_node_from_node,                      1},
    {"R_swig_librdf_new_node_from_normalised_uri_string",     (DL_FUNC) &R_swig_librdf_new_node_from_normalised_uri_string,     4},
    {"R_swig_librdf_new_node_from_typed_literal",             (DL_FUNC) &R_swig_librdf_new_node_from_typed_literal,             4},
    {"R_swig_librdf_new_node_from_uri",                       (DL_FUNC) &R_swig_librdf_new_node_from_uri,                       2},
    {"R_swig_librdf_new_node_from_uri_local_name",            (DL_FUNC) &R_swig_librdf_new_node_from_uri_local_name,            3},
    {"R_swig_librdf_new_node_from_uri_string",                (DL_FUNC) &R_swig_librdf_new_node_from_uri_string,                2},
    {"R_swig_librdf_new_parser",                              (DL_FUNC) &R_swig_librdf_new_parser,                              4},
    {"R_swig_librdf_new_query",                               (DL_FUNC) &R_swig_librdf_new_query,                               5},
    {"R_swig_librdf_new_query_from_query",                    (DL_FUNC) &R_swig_librdf_new_query_from_query,                    1},
    {"R_swig_librdf_new_serializer",                          (DL_FUNC) &R_swig_librdf_new_serializer,                          4},
    {"R_swig_librdf_new_statement",                           (DL_FUNC) &R_swig_librdf_new_statement,                           1},
    {"R_swig_librdf_new_statement_from_nodes",                (DL_FUNC) &R_swig_librdf_new_statement_from_nodes,                4},
    {"R_swig_librdf_new_statement_from_statement",            (DL_FUNC) &R_swig_librdf_new_statement_from_statement,            1},
    {"R_swig_librdf_new_storage",                             (DL_FUNC) &R_swig_librdf_new_storage,                             4},
    {"R_swig_librdf_new_storage_from_storage",                (DL_FUNC) &R_swig_librdf_new_storage_from_storage,                1},
    {"R_swig_librdf_new_uri",                                 (DL_FUNC) &R_swig_librdf_new_uri,                                 2},
    {"R_swig_librdf_new_uri_from_filename",                   (DL_FUNC) &R_swig_librdf_new_uri_from_filename,                   2},
    {"R_swig_librdf_new_uri_from_uri",                        (DL_FUNC) &R_swig_librdf_new_uri_from_uri,                        1},
    {"R_swig_librdf_new_world",                               (DL_FUNC) &R_swig_librdf_new_world,                               0},
    {"R_swig_librdf_node_equals",                             (DL_FUNC) &R_swig_librdf_node_equals,                             3},
    {"R_swig_librdf_node_get_blank_identifier",               (DL_FUNC) &R_swig_librdf_node_get_blank_identifier,               1},
    {"R_swig_librdf_node_get_li_ordinal",                     (DL_FUNC) &R_swig_librdf_node_get_li_ordinal,                     2},
    {"R_swig_librdf_node_get_literal_value",                  (DL_FUNC) &R_swig_librdf_node_get_literal_value,                  1},
    {"R_swig_librdf_node_get_literal_value_as_latin1",        (DL_FUNC) &R_swig_librdf_node_get_literal_value_as_latin1,        1},
    {"R_swig_librdf_node_get_literal_value_datatype_uri",     (DL_FUNC) &R_swig_librdf_node_get_literal_value_datatype_uri,     1},
    {"R_swig_librdf_node_get_literal_value_is_wf_xml",        (DL_FUNC) &R_swig_librdf_node_get_literal_value_is_wf_xml,        2},
    {"R_swig_librdf_node_get_literal_value_language",         (DL_FUNC) &R_swig_librdf_node_get_literal_value_language,         1},
    {"R_swig_librdf_node_get_type",                           (DL_FUNC) &R_swig_librdf_node_get_type,                           2},
    {"R_swig_librdf_node_get_uri",                            (DL_FUNC) &R_swig_librdf_node_get_uri,                            1},
    {"R_swig_librdf_node_is_blank",                           (DL_FUNC) &R_swig_librdf_node_is_blank,                           2},
    {"R_swig_librdf_node_is_literal",                         (DL_FUNC) &R_swig_librdf_node_is_literal,                         2},
    {"R_swig_librdf_node_is_resource",                        (DL_FUNC) &R_swig_librdf_node_is_resource,                        2},
    {"R_swig_librdf_node_to_string",                          (DL_FUNC) &R_swig_librdf_node_to_string,                          1},
    {"R_swig_librdf_parser_check_name",                       (DL_FUNC) &R_swig_librdf_parser_check_name,                       3},
    {"R_swig_librdf_parser_get_accept_header",                (DL_FUNC) &R_swig_librdf_parser_get_accept_header,                1},
    {"R_swig_librdf_parser_get_feature",                      (DL_FUNC) &R_swig_librdf_parser_get_feature,                      2},
    {"R_swig_librdf_parser_get_namespaces_seen_count",        (DL_FUNC) &R_swig_librdf_parser_get_namespaces_seen_count,        2},
    {"R_swig_librdf_parser_get_namespaces_seen_prefix",       (DL_FUNC) &R_swig_librdf_parser_get_namespaces_seen_prefix,       2},
    {"R_swig_librdf_parser_get_namespaces_seen_uri",          (DL_FUNC) &R_swig_librdf_parser_get_namespaces_seen_uri,          2},
    {"R_swig_librdf_parser_guess_name",                       (DL_FUNC) &R_swig_librdf_parser_guess_name,                       3},
    {"R_swig_librdf_parser_guess_name2",                      (DL_FUNC) &R_swig_librdf_parser_guess_name2,                      4},
    {"R_swig_librdf_parser_parse_as_stream",                  (DL_FUNC) &R_swig_librdf_parser_parse_as_stream,                  3},
    {"R_swig_librdf_parser_parse_counted_string_as_stream",   (DL_FUNC) &R_swig_librdf_parser_parse_counted_string_as_stream,   4},
    {"R_swig_librdf_parser_parse_counted_string_into_model",  (DL_FUNC) &R_swig_librdf_parser_parse_counted_string_into_model,  6},
    {"R_swig_librdf_parser_parse_into_model",                 (DL_FUNC) &R_swig_librdf_parser_parse_into_model,                 5},
    {"R_swig_librdf_parser_parse_string_as_stream",           (DL_FUNC) &R_swig_librdf_parser_parse_string_as_stream,           3},
    {"R_swig_librdf_parser_parse_string_into_model",          (DL_FUNC) &R_swig_librdf_parser_parse_string_into_model,          5},
    {"R_swig_librdf_parser_set_feature",                      (DL_FUNC) &R_swig_librdf_parser_set_feature,                      4},
    {"R_swig_librdf_query_execute",                           (DL_FUNC) &R_swig_librdf_query_execute,                           2},
    {"R_swig_librdf_query_get_limit",                         (DL_FUNC) &R_swig_librdf_query_get_limit,                         2},
    {"R_swig_librdf_query_get_offset",                        (DL_FUNC) &R_swig_librdf_query_get_offset,                        2},
    {"R_swig_librdf_query_results_as_stream",                 (DL_FUNC) &R_swig_librdf_query_results_as_stream,                 1},
    {"R_swig_librdf_query_results_finished",                  (DL_FUNC) &R_swig_librdf_query_results_finished,                  2},
    {"R_swig_librdf_query_results_get_binding_name",          (DL_FUNC) &R_swig_librdf_query_results_get_binding_name,          2},
    {"R_swig_librdf_query_results_get_binding_value",         (DL_FUNC) &R_swig_librdf_query_results_get_binding_value,         2},
    {"R_swig_librdf_query_results_get_binding_value_by_name", (DL_FUNC) &R_swig_librdf_query_results_get_binding_value_by_name, 2},
    {"R_swig_librdf_query_results_get_bindings_count",        (DL_FUNC) &R_swig_librdf_query_results_get_bindings_count,        2},
    {"R_swig_librdf_query_results_get_boolean",               (DL_FUNC) &R_swig_librdf_query_results_get_boolean,               2},
    {"R_swig_librdf_query_results_get_count",                 (DL_FUNC) &R_swig_librdf_query_results_get_count,                 2},
    {"R_swig_librdf_query_results_is_bindings",               (DL_FUNC) &R_swig_librdf_query_results_is_bindings,               2},
    {"R_swig_librdf_query_results_is_boolean",                (DL_FUNC) &R_swig_librdf_query_results_is_boolean,                2},
    {"R_swig_librdf_query_results_is_graph",                  (DL_FUNC) &R_swig_librdf_query_results_is_graph,                  2},
    {"R_swig_librdf_query_results_is_syntax",                 (DL_FUNC) &R_swig_librdf_query_results_is_syntax,                 2},
    {"R_swig_librdf_query_results_next",                      (DL_FUNC) &R_swig_librdf_query_results_next,                      2},
    {"R_swig_librdf_query_results_to_file",                   (DL_FUNC) &R_swig_librdf_query_results_to_file,                   5},
    {"R_swig_librdf_query_results_to_file2",                  (DL_FUNC) &R_swig_librdf_query_results_to_file2,                  6},
    {"R_swig_librdf_query_results_to_string",                 (DL_FUNC) &R_swig_librdf_query_results_to_string,                 3},
    {"R_swig_librdf_query_results_to_string2",                (DL_FUNC) &R_swig_librdf_query_results_to_string2,                5},
    {"R_swig_librdf_query_set_limit",                         (DL_FUNC) &R_swig_librdf_query_set_limit,                         3},
    {"R_swig_librdf_query_set_offset",                        (DL_FUNC) &R_swig_librdf_query_set_offset,                        3},
    {"R_swig_librdf_serializer_check_name",                   (DL_FUNC) &R_swig_librdf_serializer_check_name,                   3},
    {"R_swig_librdf_serializer_get_feature",                  (DL_FUNC) &R_swig_librdf_serializer_get_feature,                  2},
    {"R_swig_librdf_serializer_serialize_model_to_file",      (DL_FUNC) &R_swig_librdf_serializer_serialize_model_to_file,      5},
    {"R_swig_librdf_serializer_serialize_model_to_string",    (DL_FUNC) &R_swig_librdf_serializer_serialize_model_to_string,    3},
    {"R_swig_librdf_serializer_serialize_stream_to_file",     (DL_FUNC) &R_swig_librdf_serializer_serialize_stream_to_file,     5},
    {"R_swig_librdf_serializer_serialize_stream_to_string",   (DL_FUNC) &R_swig_librdf_serializer_serialize_stream_to_string,   3},
    {"R_swig_librdf_serializer_set_feature",                  (DL_FUNC) &R_swig_librdf_serializer_set_feature,                  4},
    {"R_swig_librdf_serializer_set_namespace",                (DL_FUNC) &R_swig_librdf_serializer_set_namespace,                4},
    {"R_swig_librdf_short_copyright_string_get",              (DL_FUNC) &R_swig_librdf_short_copyright_string_get,              1},
    {"R_swig_librdf_statement_equals",                        (DL_FUNC) &R_swig_librdf_statement_equals,                        3},
    {"R_swig_librdf_statement_get_object",                    (DL_FUNC) &R_swig_librdf_statement_get_object,                    1},
    {"R_swig_librdf_statement_get_predicate",                 (DL_FUNC) &R_swig_librdf_statement_get_predicate,                 1},
    {"R_swig_librdf_statement_get_subject",                   (DL_FUNC) &R_swig_librdf_statement_get_subject,                   1},
    {"R_swig_librdf_statement_is_complete",                   (DL_FUNC) &R_swig_librdf_statement_is_complete,                   2},
    {"R_swig_librdf_statement_match",                         (DL_FUNC) &R_swig_librdf_statement_match,                         3},
    {"R_swig_librdf_statement_set_object",                    (DL_FUNC) &R_swig_librdf_statement_set_object,                    2},
    {"R_swig_librdf_statement_set_predicate",                 (DL_FUNC) &R_swig_librdf_statement_set_predicate,                 2},
    {"R_swig_librdf_statement_set_subject",                   (DL_FUNC) &R_swig_librdf_statement_set_subject,                   2},
    {"R_swig_librdf_statement_to_string",                     (DL_FUNC) &R_swig_librdf_statement_to_string,                     1},
    {"R_swig_librdf_stream_end",                              (DL_FUNC) &R_swig_librdf_stream_end,                              2},
    {"R_swig_librdf_stream_get_context",                      (DL_FUNC) &R_swig_librdf_stream_get_context,                      1},
    {"R_swig_librdf_stream_get_object",                       (DL_FUNC) &R_swig_librdf_stream_get_object,                       1},
    {"R_swig_librdf_stream_next",                             (DL_FUNC) &R_swig_librdf_stream_next,                             2},
    {"R_swig_librdf_uri_compare",                             (DL_FUNC) &R_swig_librdf_uri_compare,                             3},
    {"R_swig_librdf_uri_equals",                              (DL_FUNC) &R_swig_librdf_uri_equals,                              3},
    {"R_swig_librdf_uri_to_string",                           (DL_FUNC) &R_swig_librdf_uri_to_string,                           1},
    {"R_swig_librdf_version_decimal_get",                     (DL_FUNC) &R_swig_librdf_version_decimal_get,                     1},
    {"R_swig_librdf_version_major_get",                       (DL_FUNC) &R_swig_librdf_version_major_get,                       1},
    {"R_swig_librdf_version_minor_get",                       (DL_FUNC) &R_swig_librdf_version_minor_get,                       1},
    {"R_swig_librdf_version_release_get",                     (DL_FUNC) &R_swig_librdf_version_release_get,                     1},
    {"R_swig_librdf_version_string_get",                      (DL_FUNC) &R_swig_librdf_version_string_get,                      1},
    {"R_swig_librdf_world_get_feature",                       (DL_FUNC) &R_swig_librdf_world_get_feature,                       2},
    {"R_swig_librdf_world_open",                              (DL_FUNC) &R_swig_librdf_world_open,                              1},
    {"R_swig_librdf_world_set_feature",                       (DL_FUNC) &R_swig_librdf_world_set_feature,                       4},
    {"R_swig_librdf_world_set_logger",                        (DL_FUNC) &R_swig_librdf_world_set_logger,                        3},
    {"R_SWIG_R_pushCallbackFunctionData",                     (DL_FUNC) &R_SWIG_R_pushCallbackFunctionData,                     2},
    {"R_swig_raptor_locator_byte",                            (DL_FUNC) &R_swig_raptor_locator_byte,                            2},
    {"R_swig_raptor_locator_column",                          (DL_FUNC) &R_swig_raptor_locator_column,                          2},
    {"R_swig_raptor_locator_file",                            (DL_FUNC) &R_swig_raptor_locator_file,                            1},
    {"R_swig_raptor_locator_line",                            (DL_FUNC) &R_swig_raptor_locator_line,                            2},
    {"R_swig_raptor_locator_uri",                             (DL_FUNC) &R_swig_raptor_locator_uri,                             1},
    {"R_swig_raptor_version_decimal_get",                     (DL_FUNC) &R_swig_raptor_version_decimal_get,                     1},
    {"R_swig_raptor_version_major_get",                       (DL_FUNC) &R_swig_raptor_version_major_get,                       1},
    {"R_swig_raptor_version_minor_get",                       (DL_FUNC) &R_swig_raptor_version_minor_get,                       1},
    {"R_swig_raptor_version_release_get",                     (DL_FUNC) &R_swig_raptor_version_release_get,                     1},
    {"R_swig_raptor_version_string_get",                      (DL_FUNC) &R_swig_raptor_version_string_get,                      1},
    {"R_swig_rasqal_version_decimal_get",                     (DL_FUNC) &R_swig_rasqal_version_decimal_get,                     1},
    {"R_swig_rasqal_version_major_get",                       (DL_FUNC) &R_swig_rasqal_version_major_get,                       1},
    {"R_swig_rasqal_version_minor_get",                       (DL_FUNC) &R_swig_rasqal_version_minor_get,                       1},
    {"R_swig_rasqal_version_release_get",                     (DL_FUNC) &R_swig_rasqal_version_release_get,                     1},
    {"R_swig_rasqal_version_string_get",                      (DL_FUNC) &R_swig_rasqal_version_string_get,                      1},
    {NULL, NULL, 0}
};

void R_init_redland(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
