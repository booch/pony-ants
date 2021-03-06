use "collections"

actor Cell
    var has_ant: Bool = false

    new create() =>
        None

    be place_ant() =>
        has_ant = true

type Board is Array[Array[Cell]]

actor Main
    new create(env: Env) =>
        let board_size: USize = 80  /* Board is a square with each size of this length. */
        let board: Board = create_board(board_size)
        add_ant(board, 0, 0)
        print_board(env, board)

    fun add_ant(board: Board, row_index: USize, column_index: USize): None =>
        try
            board(row_index)(column_index).place_ant()
        end

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
