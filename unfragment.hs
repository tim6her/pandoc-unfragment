import Text.Pandoc
import Text.Pandoc.JSON

unfragment :: Block -> [Block]
unfragment (Div ("",[],[("fragment","true")]) xs) = xs
unfragment x = [x]

main :: IO ()
main = toJSONFilter unfragment