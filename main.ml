(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 16:11:02 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 16:11:04 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let create_lst file =
	let input = open_in file in 
	let lst = ref [] in
	try
		while true do
			lst:=(input_line input)::!lst;
		done;
		lst
	with
		| End_of_file -> close_in input; lst
		| _ -> print_endline "There was an error, just don't know which one."; lst
	(*arrayz*)

let main file =
	try
		let rulez = create_lst file in
		Random.self_init ();
		(*let index = Random.int nb_jokes in*)
		(*print_endline (List.nth 0 rulez)*)
		print_endline file;
		let size = List.length !rulez in
		print_int size;
		print_char '\n';
		for i=0 to (size-1) do
			print_endline (List.nth !rulez i);
		done;
	with
		| End_of_file -> print_endline "Seriously ?? Empty file, well that means no joke then !!"
		| Failure err -> print_endline "Joke file doesn't seems well formated."
		| _ -> print_endline "There was an error, just don't know which one."

	(* ************************************************************************** *)
let () =
	let argv = Array.to_list Sys.argv in
	if (List.length argv) <= 1 then
		print_endline "Error: Need the name of joke file !"
	else if (List.length argv) > 2 then
		print_endline "Error: Need less args."
	else 
		main (List.nth argv 1)