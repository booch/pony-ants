use "collections"

actor Cell
    new create() =>
        None

type Board is Array[Array[Cell]]

actor Main
    new create(env: Env) =>
        let board_size: USize = 80  /* Board is a square with each size of this length. */
        print_board(env, create_board(board_size))

    fun create_board(board_size: USize): Board =>
      let board: Board = Array[Array[Cell]]
      for i in Range[USize](0, board_size) do
          let row = Array[Cell](board_size)
          for j in Range[USize](0, board_size) do
              let cell = Cell
              row.push(cell)
          end
          board.push(row)
      end
      board

    fun print_board(env: Env, board: Board): None =>
        for row in board.values() do
            var output: String = ""
            for cell in row.values() do
                output = output + ("_")
            end
            env.out.print(output)
        end
