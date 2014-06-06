%%
%% Copyright (C) 2010 by Moritz Tenorth
%%
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dependencies

% Semweb library for OWL/RDF access
:- register_ros_package(semweb).

% TUM utilities library
:- register_ros_package(ias_prolog_addons).
:- use_module(library('classifiers')).
:- use_module(library('jython')).
:- use_module(library('util')).


:- register_ros_package(knowrob_common).
% :- register_ros_package(knowrob_actions).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parse OWL files, register name spaces
:- owl_parser:owl_parse('package://ias_knowledge_base/owl/owl.owl').
:- owl_parser:owl_parse('package://ias_knowledge_base/owl/knowrob.owl').

:- rdf_db:rdf_register_ns(rdfs,    'http://www.w3.org/2000/01/rdf-schema#',     [keep(true)]).
:- rdf_db:rdf_register_ns(owl,     'http://www.w3.org/2002/07/owl#',            [keep(true)]).
:- rdf_db:rdf_register_ns(knowrob, 'http://ias.cs.tum.edu/kb/knowrob.owl#',     [keep(true)]).


% convenience: set some Prolog flags in order *not to* trim printed lists with [...]
:- set_prolog_flag(toplevel_print_anon, false).
:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true), max_depth(0), attributes(portray)]).

:- set_prolog_flag(float_format, '%.12g').

