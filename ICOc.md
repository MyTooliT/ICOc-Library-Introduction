# ICOc (Library) Intro

---

# 🍱 ICOc Parts

- **Library**
  - „Old Code“ (In folder `mytoolit.old`, only Windows)
  - „New Code“ (Everything else in `mytoolit`)
- **Command Line Tools**
  - `icoc`: UI for measurement (only Windows)
  - `icon`: New but very basic tool

---

# 📚 Library – 🏚️ Old

- Based on PCAN Python library
- Only works with **PEAK-System CAN** adapter
- Only works on **Windows**
- 🚫 Please do not use

---

# 📚 Library – ✨ New

- Based on [`python-can`](https://pypi.org/project/python-can/)
- Multi OS Support (Linux, macOS, Windows)
- Support for different CAN adapters (Untested)

---

# 💻 Code Examples – Read STH Name

```py
"""Read name of STH with device number 0"""

from asyncio import run

from mytoolit.can import Network

async def read_name(identifier):
    async with Network() as network:
        await network.connect_sensor_device(identifier)
        name = await network.get_name("STH 1")
        print(f"Connected to sensor device “{name}”")

if __name__ == "__main__":
    # Possible Identifiers:
    # - Name:          e.g. `"Test-STH"`
    # - Device Number: e.g. `1`
    # - MAC Address:   e.g. `netaddr.EUI('08-6B-D7-01-DE-81')`
    run(read_name(identifier=0))
```

```
Connected to sensor device “Test-STH”
```

---

# 💻 Code Examples – Read Data

```py
"""Read some acceleration data of STH with device name Test-STH"""

from asyncio import run
from time import time

from mytoolit.can import Network

async def read_name(identifier):
    async with Network() as network:
        await network.connect_sensor_device(identifier)

        # Read data of first channel
        async with network.open_data_stream(first=True) as stream:
            messages = 5
            async for data in stream:
                print(f"Read data values: {data.first}")
                messages -= 1
                if messages <= 0:
                    break


if __name__ == "__main__":
    run(read_name(identifier="Test-STH"))
```

```
Read data values: [32545@1699449268.487127 (65), 32663@1699449268.487127 (65), 32491@1699449268.487127 (65)]
Read data values: [32636@1699449268.487309 (66), 32540@1699449268.487309 (66), 32666@1699449268.487309 (66)]
Read data values: [32569@1699449268.487493 (67), 32642@1699449268.487493 (67), 32547@1699449268.487493 (67)]
Read data values: [32614@1699449268.487677 (68), 32513@1699449268.487677 (68), 32644@1699449268.487677 (68)]
Read data values: [32524@1699449268.488246 (69), 32626@1699449268.488246 (69), 32551@1699449268.488246 (69)]
```
