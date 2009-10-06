import Control.Applicative
import FUtil
import System.Environment

main = do
  [fN, splitLine] <- getArgs
  ls <- lines <$> readFile fN
  let
    outs = map (++ splitLine) . filter (not . null) . map unlines $
      breaks (== splitLine) ls
    w = length . show $ length outs
  mapM_ (uncurry writeFile) $
    zip (map ((fN ++) . ('-':) . padl '0' w . show) [1..]) outs

